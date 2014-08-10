class PledgesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
  	@pledge = Pledge.new
  end

  def create
  	@pledge = Pledge.create(pledge_params)
    redirect_to @event
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:about, :user_id, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
