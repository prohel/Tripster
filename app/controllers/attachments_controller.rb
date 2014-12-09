class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @trip = Trip.find(params[:trip_id])
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @trip = Trip.find(params[:trip_id])
    @attachment = @trip.attachments.new
    @attachment.created_by_id = current_user.id
    #@attachment = Attachment.new
    if(params.has_key?(:album_id))
      @attachment.album_id = params[:album_id]
    end
  end

  # GET /attachments/1/edit
  def edit
    @trip = Trip.find(params[:trip_id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @trip = Trip.find(params[:trip_id])
    @attachment.created_by_id = current_user.id

    if(params.has_key?(:album_id))
      @attachment.album_id = params[:album_id]
    end

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to trip_path(@trip.id), notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    @trip = Trip.find(params[:trip_id])
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to trip_path(@trip.id), notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:names, :category, :trip_id, :album_id, :created_by_id, :url)
    end
end
