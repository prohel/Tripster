class Friendships < ActiveRecord::Base
	has_one :user1, class_name: "User"
	has_one :user2, class_name: "User"
end
