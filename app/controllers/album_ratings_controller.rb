class AlbumRatingsController < ApplicationController
  before_action :set_album_rating, only: [:show, :edit, :update, :destroy]

  # GET /album_ratings
  # GET /album_ratings.json
  def index
    @album_ratings = AlbumRating.all
  end

  # GET /album_ratings/1
  # GET /album_ratings/1.json
  def show
  end

  # GET /album_ratings/new
  def new
    @album_rating = AlbumRating.new
  end

  # GET /album_ratings/1/edit
  def edit
  end

  # POST /album_ratings
  # POST /album_ratings.json
  def create
    @album_rating = AlbumRating.new(album_rating_params)

    respond_to do |format|
      if @album_rating.save
        format.html { redirect_to @album_rating, notice: 'Album rating was successfully created.' }
        format.json { render :show, status: :created, location: @album_rating }
      else
        format.html { render :new }
        format.json { render json: @album_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_ratings/1
  # PATCH/PUT /album_ratings/1.json
  def update
    respond_to do |format|
      if @album_rating.update(album_rating_params)
        format.html { redirect_to @album_rating, notice: 'Album rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_rating }
      else
        format.html { render :edit }
        format.json { render json: @album_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_ratings/1
  # DELETE /album_ratings/1.json
  def destroy
    @album_rating.destroy
    respond_to do |format|
      format.html { redirect_to album_ratings_url, notice: 'Album rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_rating
      @album_rating = AlbumRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_rating_params
      params.require(:album_rating).permit(:user_id, :score, :album_id)
    end
end
