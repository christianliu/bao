class TripsController < ApplicationController
  def index
  end

  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.create(user_id: params[:user_id], event_id: params[:event_id], carbon: 0)
    @amount = 100
  end

end
