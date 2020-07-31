class Product < ApplicationRecord
  has_many :product_images
  has_many :product_options
  has_many :product_prices
  has_many :product_videos




end