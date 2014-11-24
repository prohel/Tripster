class UsersController < ApplicationController
	 before_action :set_User, only: [:addFriend, :show, :edit, :update, :destroy]

  # GET /Users
  # GET /Users.json
  def index
    @Users = User.all
  end

  # GET /Users/1
  # GET /Users/1.json
  def show
  end

  def addFriend
  	
  end

  # GET /Users/new
  def new
    @User = User.new
  end

  # GET /Users/1/edit
  def edit
  end

  # POST /Users
  # POST /Users.json
  def create
    @User = User.new(User_params)
    respond_to do |format|
      if @User.save
        format.html { redirect_to @User, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @User }
      else
        format.html { render :new }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Users/1
  # PATCH/PUT /Users/1.json
  def update
    respond_to do |format|
      if @User.update(User_params)
        format.html { redirect_to @User, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @User }
      else
        format.html { render :edit }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @User.destroy
    respond_to do |format|
      format.html { redirect_to Users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_User
      @User = User.find(params[:id]) if params[:id]
      @User = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def User_params
      params.require(:User).permit(:name, :id, :start_date, :end_date)
    end
end