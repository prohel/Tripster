class NewsfeedController < ApplicationController

	def index
		result = []
		friends = current_user.friends
		friends.each do |f|
			result += f.friendships.map(&:id)
		end
		@friendships = Friendships.find(result)
	end

end
