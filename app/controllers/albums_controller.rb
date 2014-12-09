class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @trip = Trip.find(params[:trip_id])
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @attachments = Attachment.where("album_id = ?", @album.id)
  end

  # GET /albums/new
  def new
    @trip = Trip.find(params[:trip_id])
    @album = @trip.albums.new
    @album.created_by_id = current_user.id
  end

  # GET /albums/1/edit
  def edit
    @trip = Trip.find(params[:trip_id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @trip = Trip.find(params[:trip_id])
    @album.created_by_id = current_user.id

    respond_to do |format|
      if @album.save
        format.html { redirect_to trip_album_path(@trip.id, @album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @trip = Trip.find(params[:trip_id])
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to trip_album_path, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:trip_id, :name, :created_by_id)
    end
end
