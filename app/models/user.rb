class User < ApplicationRecord
  has_one :user_description

  validates :email, :nickname, uniqueness: true

  serialize :extra

  has_secure_password

  enum status: {
      customer: 0,
      partners: 10,
      unregister: 50
  }



  def as_json(option = {})
    {
        id: self.id,
        email: self.email,
        statue: self.statue,
        name: self.name,
        nickname: self.nickname,
        sns: self.sns
    }
  end
end
