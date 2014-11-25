class AddColumnsToFriendships < ActiveRecord::Migration
  def change
    add_reference :friendships, :user1, index: true
    add_reference :friendships, :user2, index: true
  end
end
