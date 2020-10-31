class AddPricesToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :price, :decimal
  end
end
