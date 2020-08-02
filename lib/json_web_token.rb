class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base .to_s

  def self.access_token_encode(payload)
    payload[:exp] = 30.month.from_now.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decode = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decode
  end

  # def self.refresh_token_encode(payload)
  #   payload[:exp] = 30.days.from_now.to_i
  #   JWT.encode(payload, SECRET_KEY)
  # end

end