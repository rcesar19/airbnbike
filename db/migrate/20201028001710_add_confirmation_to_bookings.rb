class AddConfirmationToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :confirmed, :boolean
  end
end
