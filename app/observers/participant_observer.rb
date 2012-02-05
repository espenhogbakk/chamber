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
    Juggernaut.publish "rooms:#{participant.room.id}:participants", {
      action: action,
      participant: participant
    }
  end
end
