class Trip < ActiveRecord::Base
	#validates_presence_of :created_by
	validates_date :start_date, :before => lambda{|m| m.end_date} 
	validates_date :end_date, :after => lambda{|m| m.start_date}
	acts_as_likeable
	#validates_date :end_time, :before => lambda{|m| m.date_end}
	#{on_or_before: lambda{Date.curremt}, type: :date}

	# def hasJoiningTripBeenRequested(receiverEmail, tripId)
 #    return !TripInvite.find_by_sender_email_and_receiver_email_and_trip_id(self.email, receiverEmail, tripId).blank?
 #  end
end
