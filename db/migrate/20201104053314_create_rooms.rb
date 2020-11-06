class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :heading,      null: false
      t.integer :category_id, null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
