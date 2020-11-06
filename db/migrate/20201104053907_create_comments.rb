class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :good
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
