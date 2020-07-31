class CreateProductPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :product_prices do |t|
      t.integer :price, null: false
      t.references :product, {null: false, foreign_keys: true}
      t.timestamps
    end
  end
end
