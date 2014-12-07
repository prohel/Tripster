class AttachmentCommentsController < ApplicationController
  before_action :set_attachment_comment, only: [:show, :edit, :update, :destroy]

  # GET /attachment_comments
  # GET /attachment_comments.json
  def index
    @attachment_comments = AttachmentComment.all
  end

  # GET /attachment_comments/1
  # GET /attachment_comments/1.json
  def show
  end

  # GET /attachment_comments/new
  def new
    @attachment_comment = AttachmentComment.new
  end

  # GET /attachment_comments/1/edit
  def edit
  end

  # POST /attachment_comments
  # POST /attachment_comments.json
  def create
    @attachment_comment = AttachmentComment.new(attachment_comment_params)

    respond_to do |format|
      if @attachment_comment.save
        format.html { redirect_to @attachment_comment, notice: 'Attachment comment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment_comment }
      else
        format.html { render :new }
        format.json { render json: @attachment_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachment_comments/1
  # PATCH/PUT /attachment_comments/1.json
  def update
    respond_to do |format|
      if @attachment_comment.update(attachment_comment_params)
        format.html { redirect_to @attachment_comment, notice: 'Attachment comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment_comment }
      else
        format.html { render :edit }
        format.json { render json: @attachment_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment_comments/1
  # DELETE /attachment_comments/1.json
  def destroy
    @attachment_comment.destroy
    respond_to do |format|
      format.html { redirect_to attachment_comments_url, notice: 'Attachment comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment_comment
      @attachment_comment = AttachmentComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_comment_params
      params.require(:attachment_comment).permit(:user_id, :text, :attachment_id)
    end
end
