class Attachment < ActiveRecord::Base

  has_attached_file :file
  belongs_to :message
  #validates_presence_of :message_id
end
