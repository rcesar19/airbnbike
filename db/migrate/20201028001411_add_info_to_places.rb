class AddInfoToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :name, :string
    add_column :places, :description, :text
  end
end
