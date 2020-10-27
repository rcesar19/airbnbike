class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :user, foreign_key: true, null: false
      t.references :place, foreign_key: true, null: false


      t.timestamps
    end
  end
end
