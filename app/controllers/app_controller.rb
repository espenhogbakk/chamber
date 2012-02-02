class AppController < ApplicationController
  #before_filter :require_user

  def index
    @rooms = Room.all
  end

end