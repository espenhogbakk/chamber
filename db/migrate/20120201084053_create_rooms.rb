class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :name

      t.timestamps
    end
  end
end
