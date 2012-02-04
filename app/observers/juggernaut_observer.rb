class JuggernautObserver < ActiveRecord::Observer
  observe :message, :room, :participant
    
  def after_create(rec)
    publish(:create, rec)
  end
  
  def after_update(rec)
    publish(:update, rec)
  end
  
  def after_destroy(rec)
    publish(:destroy, rec)
  end
  
  protected
    def publish(type, rec)
      Juggernaut.url = 'redis://redistogo:3d4284db411dad03463355e7e48f92f5@viperfish.redistogo.com:9158/'
      Juggernaut.publish("/observer", {
        :type  => type, :id => rec.id, 
        :klass => rec.class.name, :record => rec
      })
    end
end