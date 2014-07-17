class Event < ActiveRecord::Base
	has_many :trips
	belongs_to :owner, :class_name => "User"

	mount_uploader :attachment, AttachmentUploader


	def get_info
		total_users = 0
		total_carbon = 0
		total_pledge = 0
		total_trees = 0
		total_km = 0
		
		Trip.where(event_id: self.id).each { |trip|
			total_users++;
			total_carbon += trip.carbon;
			total_km += trip.km_travelled;
		}

		Pledge.where(event_id: self.id).each { |pledge|
			total_pledge++;
		}
		Tree.where(event_id: self.id).each { |tree| total_trees++; }

		return [total_users, total_carbon, total_km, total_trees, total_pledge]
	end
end
