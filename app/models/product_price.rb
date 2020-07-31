class ProductPrice < ApplicationRecord
  belongs_to :product
  enum status: {

  }
end