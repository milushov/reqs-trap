class TrapsController < ApplicationController

  def info
  end

  def catch
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      request_json = RequestParser.new(request).to_json
      @trap.requests.create(
        body: request_json,
        raw: request.env.inspect
      )
    end

    head :ok, content_type: "text/html"
  end

  def index
    @traps = Trap.all
  end

  def create
    if trap = Trap.create(params[:trap].permit(:secure_id))
      redirect_to trap_requests_path(trap)
    end
  end

end
