class Participant < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  def serializable_hash(options = nil)    
    {
      id: id,
      room: room,
      user: user,
      updated_at: updated_at,
      created_at: created_at
    }
  end

end
