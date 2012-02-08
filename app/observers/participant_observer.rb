class ParticipantObserver < ActiveRecord::Observer
  observe :participant

  def after_create(participant)
    publish :create, participant
  end

  def after_update(participant)
    publish :update, participant
  end

  def after_destroy(participant)
    publish :destroy, participant
  end

  private

  def publish(action, participant)
    Juggernaut.url = 'redis://redistogo:3d4284db411dad03463355e7e48f92f5@viperfish.redistogo.com:9158/'
    Juggernaut.publish "rooms:#{participant.room.id}:participants", {
      action: action,
      participant: participant
    }
  end

end
