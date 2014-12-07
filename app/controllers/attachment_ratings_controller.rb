class AttachmentRatingsController < ApplicationController
  before_action :set_attachment_rating, only: [:show, :edit, :update, :destroy]

  # GET /attachment_ratings
  # GET /attachment_ratings.json
  def index
    @attachment_ratings = AttachmentRating.all
  end

  # GET /attachment_ratings/1
  # GET /attachment_ratings/1.json
  def show
  end

  # GET /attachment_ratings/new
  def new
    @attachment_rating = AttachmentRating.new
  end

  # GET /attachment_ratings/1/edit
  def edit
  end

  # POST /attachment_ratings
  # POST /attachment_ratings.json
  def create
    @attachment_rating = AttachmentRating.new(attachment_rating_params)

    respond_to do |format|
      if @attachment_rating.save
        format.html { redirect_to @attachment_rating, notice: 'Attachment rating was successfully created.' }
        format.json { render :show, status: :created, location: @attachment_rating }
      else
        format.html { render :new }
        format.json { render json: @attachment_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachment_ratings/1
  # PATCH/PUT /attachment_ratings/1.json
  def update
    respond_to do |format|
      if @attachment_rating.update(attachment_rating_params)
        format.html { redirect_to @attachment_rating, notice: 'Attachment rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment_rating }
      else
        format.html { render :edit }
        format.json { render json: @attachment_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment_ratings/1
  # DELETE /attachment_ratings/1.json
  def destroy
    @attachment_rating.destroy
    respond_to do |format|
      format.html { redirect_to attachment_ratings_url, notice: 'Attachment rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment_rating
      @attachment_rating = AttachmentRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_rating_params
      params.require(:attachment_rating).permit(:user_id, :score, :attachment_id)
    end
end
