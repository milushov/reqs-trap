class RequestsController < ApplicationController

  def index
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      @requests = @trap.requests
    end
  end

  def show
    if @trap = Trap.find_by(secure_id: params[:trap_id])
      @request = @trap.requests.find(params[:id])
    end
  end

end
