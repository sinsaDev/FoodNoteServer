class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def token_authentication
    token = request.headers["Authorization"]
    token = token.to_s.split(" ").last
    hash = JsonWebToken.decode(token)
  end
end
