class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :author
      t.text :body
      t.references :room

      t.timestamps
    end
  end
end
