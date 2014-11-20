class Location < ActiveRecord::Base
	has_many :user_locations
end
