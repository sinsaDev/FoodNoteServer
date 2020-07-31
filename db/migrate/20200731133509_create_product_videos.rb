class CreateProductVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :product_videos do |t|
      t.references :product, {null: false, foreign_keys: true}
      t.integer :seq, null: false
      t.text :path, null: false
      t.text :url, null: false
      t.string :deleted, null: false
      t.timestamps
    end
  end
end
