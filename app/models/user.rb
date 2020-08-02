class User < ApplicationRecord
  has_many :user_description, dependent: :delete_all
  has_many :products, dependent: :delete_all

  validates :email, :nickname, uniqueness: true

  serialize :extra

  has_secure_password

  enum status: {
      customer: 0,
      partners: 10,
      unregister: 50
  }

  def detail_for_user
    user_description.last
  end

  def as_json(option = {})
    {
        id: self.id,
        email: self.email,
        statue: self.status,
        name: self.name,
        nickname: self.nickname,
        sns: self.sns,
        details: self.detail_for_user.as_json
    }
  end
end