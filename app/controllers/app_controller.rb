class AppController < ApplicationController
  before_filter :authenticate_user!

  def index
    # TODO Move this to a scope
    # TODO Include them if the current_user is a participant of the room
    @rooms = Room.where(invite_only: [nil, false])
  end

end