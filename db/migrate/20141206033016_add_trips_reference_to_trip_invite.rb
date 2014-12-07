class AddTripsReferenceToTripInvite < ActiveRecord::Migration
  def change
    add_reference :trip_invites, :trip, index: true
  end
end
