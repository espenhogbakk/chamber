class Room < ActiveRecord::Base
  
  has_many :messages, :dependent => :destroy
  
  has_many :participants
  has_many :users, :through => :participants
  
  attr_accessible :id, :name, :topic, :invite_only
  
end
