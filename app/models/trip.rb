class Trip < ActiveRecord::Base

	belongs_to :user
	belongs_to :event

	# updates the trip's carbon field and returns the carbon amount
	def set_carbon_and_km(params)
		carbon = 0
		total_km = params[:car_km].to_i + params[:bus_km].to_i + params[:train_km].to_i

		# plane
		if params[:flight_id].present?
			flight = Flight.find(params[:flight_id]) 
			carbon += flight.calculate_carbon
			total_km += flight.distance
		end

		# car
		if params[:car_id].present?
			car = Car.find(params[:car_id]) 
    	carbon += car.calculate_carbon(params[:car_km], params[:car_people])
    end

    # bus
    bus_carbon_per_km = Variable.get("bus_carbon_per_km")
    carbon += params[:bus_km].to_i * bus_carbon_per_km if params[:bus_km].present?

    # train
    train_carbon_per_km = Variable.get("train_carbon_per_km")
    carbon += params[:train_km].to_i * train_carbon_per_km if params[:train_km].present?

		self.update_attributes(carbon: carbon, km_travelled: total_km)
	end
end
