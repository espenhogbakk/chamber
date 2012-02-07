class RoomsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_room, :only =>[:show, :update, :destroy, :edit]
  
  def index
    @rooms = Room.all
    
    respond_to do |format|
      format.html
      format.json { render json: @rooms }
    end
  end
  
  def show
    if @room.participants.where(user_id: current_user.id).empty?
      @room.participants.create(user_id: current_user.id)
    end
  end
  
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Message was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /rooms/1/edit
  def edit
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :ok }
    end
  end

  private
    def find_room
      @room = Room.find(params[:id])
    end

end