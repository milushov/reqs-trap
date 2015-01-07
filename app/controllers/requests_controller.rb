require 'reloader/sse'

class RequestsController < ApplicationController
  include ActionController::Live

  CHECK_TIME = 2

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

      begin
        loop do
          requests = @trap.requests.where('created_at >= ?', Time.now - CHECK_TIME.seconds)

          if requests.any?
            resp = requests.map{ |req| render_request(req) }.join('')
            sse.write(resp, event: 'results')
          end

          sleep CHECK_TIME
        end

      rescue IOError
        # When the client disconnects, we'll get an IOError on write
      ensure
        sse.close
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

  def render_request(req)
    render_to_string(partial: 'request.html.slim', locals: {req: req}).gsub(/\n/, '')
  end

end
