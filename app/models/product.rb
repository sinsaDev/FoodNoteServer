class Product < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  has_many :product_options, dependent: :delete_all
  has_many :product_prices, dependent: :delete_all
  has_many :product_videos, dependent: :delete_all

  belongs_to :user

  enum status: {

  }

  def self.active_product
    where(deleted: "no")
  end

  def product_price
    product_prices.last
  end

  def as_json(option = {})
    {
      id: self.id,
      name: self.name,
      price: self.product_price,
      option: self.product_options.as_json,
      images: self.product_images.as_json,
      video: self.product_videos.active_product_video.as_json
    }
  end
end