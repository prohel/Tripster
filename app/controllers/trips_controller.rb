class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  #before_action :set_created_by, only: [:create, :edit, :update]
  # GET /trips
  # GET /trips.json
  def index
    #@trips = Trip.all
    @userTrips = Trip.where("created_by = ?", current_user.email)
    @friendsList ||= []   
     @userFriends = ActiveRecord::Base.connection.execute("SELECT user2_id from friendships
        where user1_id = #{current_user.id} ")
     @userFriends.each {|x| x.each do |key, value|
                                      if key == "user2_id"
                                        @friendsList << User.find(value)
                                      end
                                   end 
                        } 
    @friendsTripsList ||= []
    @friendsList.each do |friend|
        @friendsTripsList << Trip.where("created_by = ?", friend.email).to_a
                        
                      end                         
    # @friendsList.each do |friend|
    #                       @friendsTripsList = ActiveRecord::Base.connection.execute("SELECT * from trips
    #     where created_by = #{friend.email}")
                        
    #                   end                         
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # GET /trips/1/invite
  def invite
    #respond to do |format|
    @tripId = params[:type]
    @invitedTrip = Trip.find(@tripId)
    @invitedUserEmail = User.where(:id => current_user.id).select(:email)
    @inviteFriendsList ||= []   
     @friends = ActiveRecord::Base.connection.execute("SELECT user2_id from friendships
        where user1_id = #{current_user.id} EXCEPT
        SELECT U1.id from users U1, users U2, trip_invites TI, trips T where U1.email = TI.receiver_email
        and TI.sender_email = T.created_by and  T.id = TI.trip_id and U2.email = T.created_by and
        U2.id = #{current_user.id}")
     @friends.each {|x| x.each do |key, value|
                                      if key == "user2_id"
                                        @inviteFriendsList << User.find(value)
                                      end
                                   end 
                        }
      #format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
      #end                
  end

  # def requestTrips
  # end


  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.created_by = current_user.email
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showTripNotifications
    # @userTrips = Trip.where("created_by = ?", current_user.email)
    # @friendsList ||= []   
    #  @userFriends = ActiveRecord::Base.connection.execute("SELECT user2_id from friendships
    #     where user1_id = #{current_user.id} ")
    #  @userFriends.each {|x| x.each do |key, value|
    #                                   if key == "user2_id"
    #                                     @friendsList << User.find(value)
    #                                   end
    #                                end 
    #                     } 
    # @friendsTripsList ||= []
    # @friendsList.each do |friend|
    #     @friendsTripsList << Trip.where("created_by = ?", friend.email).to_a
                        
    #                   end 
    @myRequestsToJoinTrip = TripInvite.find_by_sql("SELECT * FROM trip_invites TI, trips T, users U
      WHERE TI.trip_id = T.id and U.id = #{current_user.id} and T.created_by != U.email
      and T.created_by = TI.receiver_email")

    @friendsInvitedToTrip = TripInvite.find_by_sql("SELECT * FROM trip_invites TI, trips T, users U
      WHERE TI.trip_id = T.id and U.id = #{current_user.id} and T.created_by = U.email
      and T.created_by = TI.sender_email")           

    @requestsToJoinMyTrip = TripInvite.find_by_sql("SELECT * FROM trip_invites TI, trips T, users U 
      WHERE TI.trip_id = T.id and U.id = #{current_user.id} and T.created_by = TI.receiver_email and 
      TI.receiver_email = U.email")

    @requestsToJoinFriendsTrip = TripInvite.find_by_sql("SELECT * FROM trip_invites TI, trips T, users U 
      WHERE TI.trip_id = T.id and U.id = #{current_user.id} and T.created_by = TI.sender_email and 
      TI.receiver_email = U.email")
  end

  # def hasJoiningTripBeenRequested(receiverEmail, tripId)
  #   return !TripInvite.find_by_sender_email_and_receiver_email_and_trip_id(self.email, receiverEmail, tripId).blank?
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :id, :start_date, :end_date)
    end

    # Set created_by
   # def set_created_by
    #  @trip = Trip.find(params[:id])
     # @trip[:created_by] = "sandesh"
    #end
end
