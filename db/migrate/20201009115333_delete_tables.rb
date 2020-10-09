class DeleteTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_images
    drop_table :product_options
    drop_table :product_videos
    drop_table :products
    drop_table :user_descriptions
    drop_table :product_prices
  end



end
