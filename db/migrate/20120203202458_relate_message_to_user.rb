class RelateMessageToUser < ActiveRecord::Migration
  def up
      remove_column(:messages, :users)
  end

  def down
      add_column :messages, :users, :string
  end

  def change
    change_table :messages do |t|
      t.references :user
    end
  end

end
