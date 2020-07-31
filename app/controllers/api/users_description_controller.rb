class Api::UsersDescriptionController < Api::ApplicationController
  before_action :token_authentication


  def create
    @user.user_description.create! user: @user
    UserDescription.create!(user_params)
  end

  private
  def user_params
    params.permit(:address, :gender, :phone, :grade)
  end
end