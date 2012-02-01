class Message < ActiveRecord::Base
  
  belongs_to :room
  
  validates_presence_of :body, :room_id
  attr_accessible :id, :author, :body, :room_id
  
end
