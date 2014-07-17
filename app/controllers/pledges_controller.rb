class PledgesController < ApplicationController
  def new
  	@pledge = Pledge.new
  end

  def create
  	@pledge = Pledge.create(pledge_params)

    redirect_to Event.find(params[:pledge][:event_id])
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:about, :user_id, :event_id)
  end
end
