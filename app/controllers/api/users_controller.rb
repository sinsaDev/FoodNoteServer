class Api::UsersController < Api::ApplicationController
  before_action :token_authentication

  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    # access_token과 refresh_token을 두개 생성
    # refresh_token은 db의 extra에 저장하고 클라이언트에서 access_token 재발급 요청 시 비교 후 재발급
    access_token = JsonWebToken.access_token_encode(user_id: user.id)
    refresh_token = JsonWebToken.refresh_token_encode(user_id: user.id)
    user.extra ||= {}
    user.extra.merge!(refresh_token: refresh_token)
    if user.save
      render json: ResponseWrap.data_wrap(user.as_json.merge(access_token: access_token, refresh_token: refresh_token)), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end


  def login
    # 로그인시 받은 아이디를 토대로 유저 정보를 찾는다
    # 그 후 DB에 저장된 비밀번호와 비교하여 맞을 시 200 보내고 아닐 시 401
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      render json: ResponseWrap.data_wrap(user.as_json.merge(access_token: @new_access_token)), status: :ok
    else
      render json: ResponseWrap.data_wrap(nil), status: :unauthorized
    end
  end

  def show
    user = User.find params[:id]
    render json: ResponseWrap.data_wrap(user.as_json.merge(access_token: @new_access_token)), status: :ok
  end

  private
  def user_params
    params.permit(:email, :password, :name, :nickname, :sns)
  end
end