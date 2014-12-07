class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  validates_presence_of :name

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.image = auth.info.image # assuming the user model has an image
	  end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def hasFriendshipBeenRequested(target)
    return !Friendships.find_by_user1_id_and_user2_id(self.id, target.id).blank?
  end

  def friends
    result = []
    friendships_request = Friendship.find_by_user1_id(self.id)
    friendships_request.each do |fr|
      result << user2_id if fd.isReciprocate
    end
    friendships_invites = Friendship.find_by_user2_id(self.id)
    friendships_invites.each do |fi|
      result << user1_id if fi.isReciprocate && !result.contains(user1_id)
    end
  end

  def friendships
    result = []
    
  end

 acts_as_liker

end
