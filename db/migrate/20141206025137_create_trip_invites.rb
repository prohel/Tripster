class CreateTripInvites < ActiveRecord::Migration
  def change
    create_table :trip_invites do |t|

      t.timestamps
    end
  end
end
