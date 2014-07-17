class TripsController < ApplicationController
  def index
  end

  def new
  	@trip = Trip.new
  end

  def create
    @trip = Trip.create(user_id: params[:user_id], event_id: params[:event_id])
    @carbon = @trip.calculate_carbon(params[:car_km].to_f, params[:car_people].to_i, params[:bus_km].to_f, params[:bus_people].to_i, params[:plane_hours].to_f, params[:train_km].to_f)

    @tree_amount = (@carbon / 1000).round(2)
    @money_amount = (@carbon * 12 / 1000).round(2)
    redirect_to trip_path(user_id: params[:user_id], event_id: params[:event_id])
  end
end
