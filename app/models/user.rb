class User < ApplicationRecord
  has_one :user_description

  validates :email, :nickname, uniqueness: true

  serialize :extra

  has_secure_password

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
