class NewsfeedController < ApplicationController

	def index
		@friendships = friends
	end

end
