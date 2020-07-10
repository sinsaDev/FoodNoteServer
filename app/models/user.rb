class User < ApplicationRecord
  has_one :user_description
  has_secure_password
end
