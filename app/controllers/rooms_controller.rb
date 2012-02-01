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
  
  def create
    room = Room.create!(params)
    
    head :ok
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