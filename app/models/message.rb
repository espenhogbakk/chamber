class Message < ActiveRecord::Base
  
  has_one :attachment
  belongs_to :user
  belongs_to :room
  
  validates_presence_of :body, :room_id, :user_id

  def serializable_hash(options = nil)    
    {
      id: id,
      body: body,
      room: room,
      user: user,
      updated_at: updated_at,
      created_at: created_at,
      attachment: attachment,
    }
  end
  
end
