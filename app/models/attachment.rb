class Attachment < ActiveRecord::Base

  has_attached_file :attachment
  belongs_to :message
  #validates_presence_of :message_id
  
  
  def attachment_url 
    self.attachment.url 
  end 
  
  def serializable_hash(options = nil)    
    {
      id: id,
      message_id: message_id,
      updated_at: updated_at,
      created_at: created_at,
      attachment_url: attachment_url,
      attachment_content_type: attachment_content_type,
      attachment_file_size: attachment_file_size,
    }
  end
  
end
