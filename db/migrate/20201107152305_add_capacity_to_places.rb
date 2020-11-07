class AddCapacityToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :capacity, :integer
  end
end
