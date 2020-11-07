class User < ApplicationRecord
  #has_many :user_description, dependent: :delete_all
  #has_many :products, dependent: :delete_al
  has_many :comments, as: :commentable

  before_save :generate_user_code

  serialize :extra

  has_secure_password

  enum status: {
      not_phone_certified: 0,
      sign_up: 10,
      unregister: 20
  }

  enum sns: {
      kakao: 0,
      naver: 1,
      facebook: 2
  }

  def self.sign_up_check(params)
    find_by(email: params[:email], sns: params[:sns])
  end

  def self.user_information_update(params)
    find_by(email: params[:email], sns: params[:sns])
  end

  def as_json(option = {})
    {
        id: self.id,
        email: self.email,
        status: self.status,
        name: self.name,
        sns: self.sns
    }
  end

  private

  def generate_user_code
    self.name = "user" + rand(00000000...99999999).to_s
  end

  # def detail_for_user
  #   user_description.last
  # end
end