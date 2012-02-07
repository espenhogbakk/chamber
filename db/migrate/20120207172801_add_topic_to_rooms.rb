class AddTopicToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :topic, :string
  end
end
