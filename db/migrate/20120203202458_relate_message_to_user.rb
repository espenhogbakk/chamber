class RelateMessageToUser < ActiveRecord::Migration

  def change
    change_table :messages do |t|
      t.references :user
    end
  end

end
