class ProductOption < ApplicationRecord
  belongs_to :product

  enum status: {

  }

  def as_json(option = {})
    {
      id: self.id,
      color: self.color,
      size: self.size,
    }
  end
end