class ParticipantsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if params.include? :room_id
      room = Room.find(params[:room_id])
      @participants = room.participants
    else
      @participants = Participant.all
    end

    respond_to do |format|
      format.json { render json: @participants }
    end

  end
  
  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end

  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    if params.include? :room_id
      # If room is is sent, delete by user_id
      room = Room.find(params[:room_id])
      @participant = room.participants.where(user_id: params[:id]).first
    else
      @participant = Participant.find(params[:id])
    end
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end

end
