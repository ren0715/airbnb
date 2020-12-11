class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.integer :total_price

      t.timestamps
    end
  end
end
