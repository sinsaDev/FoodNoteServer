class Api::UsersDescriptionController < Api::ApplicationController
  before_action :token_authentication

  def create
    user_description = @user.user_description.new user_description_params
    if user_description.save
      render json: ResponseWrap.data_wrap(nil), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, user_description.errors.details), status: :bad_request
    end
  end

  private
  def user_description_params
    params.permit(:address, :gender, :phone, :grade)
  end
end