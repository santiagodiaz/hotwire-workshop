# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
