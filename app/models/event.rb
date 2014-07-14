class Event < ActiveRecord::Base
	has_many :trips
	belongs_to :owner, :class_name => "User"
end
