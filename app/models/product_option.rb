class ProductOption < ApplicationRecord
  belongs_to :product

  enum status: {

  }
end