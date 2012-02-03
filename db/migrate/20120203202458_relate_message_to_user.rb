class RelateMessageToUser < ActiveRecord::Migration
  def up
      remove_column(:messages, :author)
  end

  def down
      add_column :messages, :author, :string
  end

  def change
    change_table :messages do |t|
      t.references :user
    end
  end

end
