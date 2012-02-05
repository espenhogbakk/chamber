class AddAttachmentToAttachment < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :attachments, :attachment
  end
end
