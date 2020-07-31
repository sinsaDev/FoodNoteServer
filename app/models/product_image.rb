class ProductImage < ApplicationRecord
  belongs_to :product

  enum status: {

  }
end
