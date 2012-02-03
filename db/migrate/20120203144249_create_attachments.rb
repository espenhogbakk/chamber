class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :message

      t.timestamps
    end
  end

  def self.up
    change_table :attachments do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :attachments, :file
  end

end
