class AttachmentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.json { render json: @attachments }
    end

  end
  
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.json { render json: @attachment }
    end
  end

  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.json { render json: @attachment }
    end
  end

  def edit
    @attachment = Attachment.find(params[:id])
  end

  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.json { render json: @attachment, status: :created, location: @attachment }
      else
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.json { head :ok }
      else
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end
end