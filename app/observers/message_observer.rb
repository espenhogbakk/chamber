class MessageObserver < ActiveRecord::Observer
  observe :message

  def after_create(message)
    publish :create, message
  end

  def after_update(message)
    publish :update, message
  end

  def after_destroy(message)
    publish :destroy, message
  end

  private

  def publish(action, message)
    Juggernaut.publish "rooms:#{message.room.id}:messages", {
      action: action,
      message: message
    }
  end
end
