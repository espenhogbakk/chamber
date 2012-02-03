class Message < ActiveRecord::Base
  
  has_one :attachment
  belongs_to :user
  belongs_to :room
  
  validates_presence_of :body, :room_id, :user_id
  
end
