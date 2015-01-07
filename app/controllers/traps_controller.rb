class TrapsController < ApplicationController

  def info
  end

  def create
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      request_json = RequestParser.new(request).to_json
      @trap.requests.create(body: request_json)
    end

    head :ok, content_type: "text/html"
  end

  def index
    @traps = Trap.all
  end

end
