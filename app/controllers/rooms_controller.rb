class RoomsController < ApplicationController
  
  #before_filter :require_user
  before_filter :find_room, :only =>[:show, :update, :destroy]
  
  def index
    @rooms = Room.all
    
    respond_to do |format|
      format.html
      format.json { render json: @rooms }
    end
  end
  
  def show
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
  
  
  def update
    @room.update_attributes!(params)
    
    head :ok
  end
  
  def destroy
    @room.destroy

    head :ok
  end
  
  private
    def find_room
      @room = Room.find(params[:id])
    end

end