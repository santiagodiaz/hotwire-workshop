class CreateShippingAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :country
      t.string :city
      t.string :state
      t.string :line1
      t.string :line2
      t.string :postal_code
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
