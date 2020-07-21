class Api::UsersController < Api::ApplicationController
  before_action :token_authentication, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render json: ResponseWrap.data_wrap(user.as_json), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end


  def login
    # 로그인시 받은 아이디를 토대로 유저 정보를 찾은 후,
    # access_token과 refresh_token을 내려준다.
    @user = User.find_by_email params[:email]
    if @user&.authenticate params[:password]
      make_token
      render json: ResponseWrap.data_wrap(@user.as_json.merge(access_token: @access_token)), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil), status: :unauthorized
    end
  end

  def show
    user = User.find params[:id]
    render json: ResponseWrap.data_wrap(user.as_json.merge(access_token: @access_token)), status: :ok
  end

  def destroy
    if @user.update!(status: "unregister")
      render json: ResponseWrap.data_wrap(user.as_json), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end

  private
  def user_params
    params.permit(:email, :password, :name, :nickname)
  end
end