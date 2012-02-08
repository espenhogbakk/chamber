class Roster < SuperModel::Base
  include SuperModel::Redis::Model
  include SuperModel::Timestamp::Model

  #redis_options :host => "redistogo@viperfish.redistogo.com", :port => 9158, :password => "3d4284db411dad03463355e7e48f92f5"

  attributes :count

  belongs_to :user
  validates_presence_of :user_id
  
  belongs_to :room

  indexes :user_id  

  class << self

    def subscribe
      Juggernaut.subscribe do |event, data|
        data.default = {}
        user_id = data["meta"]["user_id"]
        room_id = data["meta"]["room_id"]

        next unless user_id &&

        case event
        when :subscribe
          event_subscribe(user_id, room_id)
        when :unsubscribe
          event_unsubscribe(user_id)
        end
      end
    end

    protected
      def event_subscribe(user_id, room_id)
        user = find_by_user_id(user_id) || self.new(user_id: user_id, room_id: room_id)
        user.increment!
      end

      def event_unsubscribe(user_id)
        user = find_by_user_id(user_id)
        user && user.decrement!
      end
  end

  def count
    read_attribute(:count) || 0
  end

  def increment!
    self.count += 1
    save!
  end

  def decrement!
    self.count -= 1
    self.count > 0 ? save! : destroy
  end

end