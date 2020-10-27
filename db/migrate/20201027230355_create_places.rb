class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :address
      t.boolean :available
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

