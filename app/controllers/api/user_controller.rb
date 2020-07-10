class Api::UsersController < Api::ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: ResponseWrap.data_wrap(user.as_json), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end

  def login
    # 로그인시 받은 아이디를 토대로 유저 정보를 찾는다
    # 그 후 DB에 저장된 비밀번호와 비교하여 맞을 시 200 보내고 아닐 시 401
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      render json: ResponseWrap.data_wrap(user.as_json), status: :ok
    else
      render json: RESERVED_NAMES.data_wrap(nil), status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:email, :password_digest, :nickname, :sns, extra: {})
  end
end