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
    friendships_request = Friendships.where("user1_id = ?", self.id)
    friendships_request.each do |fr|
      result << fr.user2_id if fr.isReciprocate
    end
    friendships_invites = Friendships.where("user2_id = ?", self.id)
    friendships_invites.each do |fi|
      result << fi.user1_id if fi.isReciprocate && !result.include?(fi.user1_id)
    end
    User.find(result)
  end

  def friendships
    result = []
    friendships_request = Friendships.where("user1_id = ?", self.id)
    friendships_request.each do |fr|
      r = fr.reciprocate
      if r
        if fr.created_at > r.created_at
          result << fr
        else
          result << r
        end
      end
    end
    friendships_invites = Friendships.where("user2_id = ?", self.id)
    friendships_invites.each do |fi|
      r = fi.reciprocate
      if r
        if fi.created_at > r.created_at
          result << fi if !result.include?(fi)
        else
          result << r if !result.include?(r)
        end
      end
    end
  end

 acts_as_liker

end
