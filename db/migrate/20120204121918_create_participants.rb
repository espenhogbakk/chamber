class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :room
      t.references :user

      t.timestamps
    end
    add_index :participants, :room_id
    add_index :participants, :user_id
  end
end
