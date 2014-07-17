class Trip < ActiveRecord::Base
	belongs_to :user
	belongs_to :event

	# updates the trip's carbon field and returns the carbon amount
	def calculate_carbon(car_km, car_people, bus_km, bus_people, plane_hours, train_km)
		carbon = 0
	    # binding.pry
	    # car
	    if car_people > 0 
	      carbon += (car_km * 0.105 / car_people)
	    end
	    # bus
	    if bus_people > 0
	      carbon += (bus_km * 0.21 / bus_people)
	    end
	    # plane
	    if plane_hours > 0 
	      if plane_hours <= 1
	        carbon += 250
	      elsif plane_hours <= 12
	        carbon += 4150
	      else
	        carbon += 5028
	      end
	    end
	    # train
	    carbon += (train_km * 0.5)

		self.update_attributes(carbon: carbon)
		carbon
	end

end
