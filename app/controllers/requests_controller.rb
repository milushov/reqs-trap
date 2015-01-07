require 'reloader/sse'

class RequestsController < ApplicationController

  before_action :set_trap

  def index
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      @requests = @trap.requests
    end
  end

  def stream
    if @trap
      response.headers['Content-Type'] = 'text/event-stream'
      sse = Reloader::SSE.new(response.stream)

      @requests = @trap.requests

      last_updated = @trap.requests.first
      puts last_updated.id

      #if true
      a = true
      if a || recently_changed?(last_updated)
        a = false
        begin
          sse.write(last_updated, event: 'results')
          #sse.write({name: 'hello'}, event: 'results')
        rescue IOError
          # When the client disconnects, we'll get an IOError on write
        ensure
          sse.close
        end
      end
    end
  end

  def show
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      @request = @trap.requests.find(params[:id])
    end
  end

  private

  def set_trap
    @trap = Trap.find_by(secure_id: params[:trap_id])
  end

end
