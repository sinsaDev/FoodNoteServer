class Api::ApplicationController < ActionController::Base

  def create

  end

  def user_params
    params.permit(:email, :password, :name, :nickname)
  end
end
