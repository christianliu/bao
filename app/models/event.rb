class Event < ActiveRecord::Base
	has_many :trips
	belongs_to :owner, :class_name => "User"

	mount_uploader :attachment, AttachmentUploader


	def get_info
		total_users = 0
		total_carbon = 0
		total_pledges = 0
		total_trees = 0
		total_km = 0
		
		trips = Trip.where(event_id: self.id)
		if trips
			trips.each { |trip|
				total_users += 1
				total_carbon += trip.carbon
				total_km += trip.km_travelled
			}
		end

		pledges = Pledge.where(event_id: self.id)
		if pledges
			pledges.each { |pledge|	total_pledges += 1 }
		end

		trees = Tree.where(event_id: self.id)
		if trees
			trees.each { |tree|	total_trees += 1 }
		end

		return [total_users, total_carbon, total_km, total_trees, total_pledges]
	end
end
