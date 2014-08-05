class Trip < ActiveRecord::Base

	belongs_to :user
	belongs_to :event

	# updates the trip's carbon field and returns the carbon amount
	def set_carbon(params)
		params = Trip.sanitize(params)
		carbon = 0
    # car
    carbon += params[:car_km] * params[:car_size] / params[:car_people] if params[:car_people]
    # bus
    carbon += params[:bus_km] * 0.109 if params[:bus_people]
    # plane
    carbon += params[:plane_type] if params[:plane_type]
    # train
    carbon += params[:train_km] * 0.047 if params[:train_km]
		# km = car_km + bus_km + train_km + 850*plane_hours
		self.update_attributes(carbon: carbon)
	end

	def self.car_sizes
		[["Small",0.4],["Medium",0.5],["Large",0.6]]
	end

	def self.plane_types
		[['South Africa', 1000*0.192],
		['Southern Africa', 4000*0.192],
		['Northern Africa', 8000*0.226],
		['Europe', 10000*0.226],
		['Australia', 11000*0.226],
		['Middle East', 8000*0.226],
		['Far East', 13000*0.226],
		['North America (East Coast)', 12500*0.226],
		['North America (West Coast)', 16000*0.226],
		['South America', 8000*0.226]]
	end 

	def self.sanitize(params)
		clean_params = {}
		[:car_km, :car_people, :car_size, :bus_km, :train_km, :plane_type].each do |metric|
			if params[metric].present?
				clean_params[metric] = params[metric].to_f
			end
		end
		clean_params
	end
end
