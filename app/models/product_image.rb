class ProductImage < ApplicationRecord
  belongs_to :product

  enum status: {

  }

  def as_json(option = {})
    {
      id: self.id,
      seq: self.seq,
      url: self.url,
      path: self.path,
      field: self.field
    }
  end
end
