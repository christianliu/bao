class TripsController < ApplicationController
  def index
  end

  def new
  	@trip = Trip.new
  end

  def create
  	car_km = params[:car_km].to_f
    car_people = params[:car_people].to_f
    bus_km = params[:bus_km].to_f
    bus_people = params[:bus_people].to_f
    plane_hours = params[:plane_hours].to_f
    train_km = params[:train_km].to_f

    @carbon = 0
    carbon = 0
    
    # car
    carbon += (car_km * 0.105 / car_people)
    # bus
    carbon += (bus_km * 0.21 / bus_people)
    # plane
    if plane_hours == 0
    elsif plane_hours <= 1
      carbon += 250
    elsif plane_hours <= 12
      carbon += 4150
    else
      carbon += 5028
    end
    # train
    carbon += (train_km * 0.5)
    @carbon = car_km


    @trip = Trip.create(user_id: params[:user_id], event_id: params[:event_id], carbon: @carbon)
  	# @carbon = @trip.calculate_carbon(params[:car_km].to_f, params[:car_people].to_f, params[:bus_km].to_f, params[:bus_people].to_f, params[:plane_hours].to_f, params[:train_km].to_f)
  	# @trip.save

    @tree_amount = @carbon / 1000
    @money_amount = @tree_amount * 12
  end
end
