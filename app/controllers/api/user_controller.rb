class Api::UsersController < Api::ApplicationController

  def create
    user = User.new(user_params)
    if user.save

    end
  end


  private
  def user_params
    params.permit(:email, :password, :nickname, :sns)
  end

end
