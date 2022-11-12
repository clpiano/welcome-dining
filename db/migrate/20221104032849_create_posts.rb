class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :restaurant_id,      null: false
      t.text :content,               null: false
      t.string :link
      t.boolean :reservation_status, null: false, default: true
      t.timestamps
    end
  end
end
