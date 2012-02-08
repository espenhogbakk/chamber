class RosterObserver < ActiveRecord::Observer
  observe :roster

  def after_create(roster)
    publish :create, roster
  end

  def after_update(roster)
    publish :update, roster
  end

  def after_destroy(roster)
    publish :destroy, roster
  end

  private
  def publish(action, roster)
    Juggernaut.publish "rooms:#{roster.room_id}:roster", {
      action: action,
      roster: roster
    }
  end
end
