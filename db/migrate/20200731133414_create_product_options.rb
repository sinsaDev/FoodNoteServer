class CreateProductOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_options do |t|
      t.references :product, {null: false, foreign_keys: true}
      t.string :color, null: false
      t.string :size, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
