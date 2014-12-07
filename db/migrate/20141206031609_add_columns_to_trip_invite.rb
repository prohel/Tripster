class AddColumnsToTripInvite < ActiveRecord::Migration
  def change
    add_column :trip_invites, :sender_email, :string
    add_column :trip_invites, :receiver_email, :string
    add_column :trip_invites, :accepted, :integer
  end
end
