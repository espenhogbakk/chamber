class AddInviteOnlyToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :invite_only, :boolean
  end
end
