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
      #Juggernaut.url = 'someredisurl'
      Juggernaut.publish("/observer", {
        :type  => type, :id => rec.id, 
        :klass => rec.class.name, :record => rec
      })
    end
end