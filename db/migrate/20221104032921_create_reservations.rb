class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.integer :restaurant_id,    null: false
      t.integer :customer_id,      null: false
      t.integer :number_of_people, null: false
      t.string :reservation_time, null: false
      t.text :note
      t.integer :approval_status
      t.timestamps
    end
  end
end
