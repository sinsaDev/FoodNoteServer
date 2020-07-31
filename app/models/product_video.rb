class ProductVideo < ApplicationRecord
  belongs_to :product

  enum status: {

  }
end