class TripInvite < ActiveRecord::Base
	has_one :trip, class_name: "Trip"

	# def hasJoiningTripBeenRequested(receiverEmail, tripId)
 #    return !TripInvite.find_by_sender_email_and_receiver_email_and_trip_id(current_user.email, receiverEmail, tripId).blank?
 #  end
end
