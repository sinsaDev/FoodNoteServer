class ProductVideo < ApplicationRecord
  belongs_to :product

  enum status: {

  }

  def self.active_product_video
    where(deleted: "no")
  end

  def as_json(option = {})
    {
      id: self.id,
      seq: self.seq,
      url: self.url,
      path: self.path
    }
  end
end