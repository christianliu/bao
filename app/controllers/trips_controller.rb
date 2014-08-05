class TripsController < ApplicationController
  before_action :set_event, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
  	@trip = Trip.new    
  end

  def create
    @trip = Trip.create(user_id: @user.id, event_id: params[:event_id])
    @trip.set_carbon(params)
    # @km = info[1]
    # binding.pry
    @tree_amount = (@trip.carbon / 1000).round(2)
    @money_amount = (@tree_amount * 12).round(2)
  end

  private 

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
