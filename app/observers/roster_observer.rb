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
    Juggernaut.url = 'redis://redistogo:3d4284db411dad03463355e7e48f92f5@viperfish.redistogo.com:9158/'
    Juggernaut.publish "rooms:#{roster.room_id}:roster", {
      action: action,
      roster: roster
    }
  end
end
