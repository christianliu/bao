class User < ActiveRecord::Base
	has_many :trips
	has_many :trees
	has_many :pledges

end
