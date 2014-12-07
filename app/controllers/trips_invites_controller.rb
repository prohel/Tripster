class TripsInvitesController < ApplicationController
	#GET /trips/1/invitedToTrip
  def create
  	

  	# params[0] = current_user.email
  	# params[1] = :receiver_email
  	
    @receiver_email = params[:receiver_email]
    @trip_id = params[:trip_id]
    @accepted = params[:accepted]
    params = Hash[:sender_email => current_user.email, :receiver_email => @receiver_email, :accepted => @accepted, :trip_id => @trip_id]
    #@userTrip = Trip.where("id = ?", @trip_id)
    @trips_invites = TripInvite.new(params)
    if @trips_invites.save
    	redirect_to(trips_path())
    	#redirect_to :controller => 'trip', :action => 'index'
    end
  end

  def requestTrip
  	
    @req_trip_id = params[:trip_id]
    @accepted = params[:accepted]
    reqTrip = Trip.find(@req_trip_id)
    #requestingUser = User.where('email = ?' reqTrip.created_by)
    @receiver_email = reqTrip.created_by
    params = Hash[:sender_email => current_user.email, :receiver_email => @receiver_email, 
    	:accepted => @accepted, :trip_id => @req_trip_id]
    #@userTrip = Trip.where("id = ?", @trip_id)
    @trips_invites = TripInvite.new(params)
    if @trips_invites.save
    	redirect_to(trips_path())
    	#redirect_to :controller => 'trip', :action => 'index'
    end
  end

  # def acceptRequest

  # end

  # def declineRequest

  # end
  
  def edit
    sender_email = params[:sender_email]
    receiver_email = params[:receiver_email]
    trip_id = params[:tripid]
    tripInvite = TripInvite.find_by_sender_email_and_receiver_email_and_trip_id(sender_email, receiver_email, trip_id)
    accepted = params[:accepted]
    tripInvite.accepted = accepted
    tripInvite.save
    redirect_to(trips_path())
  end


  # def hasJoiningTripBeenRequested(receiverEmail, tripId)
  # # 	flag = 0
  # # 	if(flag)
  # # 		flag = 0
  # # 		return 1
  # # 	else
  # # 		flag = 1
  # # 		return 0
  #    return !TripInvite.find_by_sender_email_and_receiver_email_and_trip_id(current_user.email, receiverEmail, tripId).blank?
  # end

 # private
    
 #    # Never trust parameters from the scary internet, only allow the white list through.
 #    def trips_invites_params
 #      params.require(:trips_invites).permit(:sender_email, :receiver_email, :accepted, :trip_id)
 #    end
end
