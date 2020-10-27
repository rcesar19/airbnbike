class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :address
      t.boolean :available

      t.timestamps
    end
  end
end
