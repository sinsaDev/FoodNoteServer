class Product < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  has_many :product_options, dependent: :delete_all
  has_many :product_prices, dependent: :delete_all
  has_many :product_videos, dependent: :delete_all

  belongs_to :user

  enum status: {

  }

end