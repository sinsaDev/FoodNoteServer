class Api::UsersController < Api::ApplicationController
  # before_action :token_authentication, only: [:show, :destroy]
  #skip_before_action :verify_authenticity_token

  def create
    user = User.user_information_update(user_params)
    # 유저 정보 있는지 체크
    if user.present?
      user.status = User.statuses[:sign_up]
      user.phone = user_params[:phone]
      user.nickname = user_params[:nickname]
      if user.save
        render json: ResponseWrap.data_wrap(user.as_json), status: :ok
      else
        render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
      end
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end

  def social_login
    # 회원가입 여부 체크
    if User.sign_up_check(social_params)
      user = User.sign_up_check(social_params)
      # 추가 회원가입이 끝나지 않은 경우 -> 추가 회원가입 화면으로
      if user.status.not_phone_certified?
        render json: ResponseWrap.data_wrap(user.as_json), status: :created
        # 추가 회원가입이 끝난 경우 -> 로그인화면으로
      elsif user.status.sign_up?
        render json: ResponseWrap.data_wrap(user.as_json), status: :ok
        # 에러 발생
      else
        render json: ResponseWrap.data_wrap(nil), status: :bad_request
      end
    else
      user = User.new(social_params)
      # 회원가입 성공 여부
      if user.save
        render json: ResponseWrap.data_wrap(user.as_json), status: :created
      else
        render json: ResponseWrap.data_wrap(nil), status: :bad_request
      end
    end
  end

  def kakao_login
    # 회원가입 여부 체크
    if User.sign_up_check(kakao_params)
      user = User.sign_up_check(kakao_params)
      # 휴대폰인증이 끝나지 않은 경우 -> 휴대폰인증 화면으로
      if user.status == User.statuses[:not_phone_certified]
        render json: ResponseWrap.data_wrap(user.as_json), status: :created
        # 휴대폰인증이 끝난 경우 -> 로그인화면으로
      elsif user.status == User.statuses[:sign_up]
        render json: ResponseWrap.data_wrap(user.as_json), status: :ok
        # 에러 발생
      else
        render json: ResponseWrap.data_wrap(nil), status: :bad_request
      end
    else
      user = User.new(kakao_params)
      # 회원가입 성공 여부
      if user.save
        render json: ResponseWrap.data_wrap(user.as_json), status: :created
      else
        render json: ResponseWrap.data_wrap(nil), status: :bad_request
      end
    end
  end

  # def create
  #   user = User.new(user_params)
  #   if user.save
  #     render json: ResponseWrap.data_wrap(user.as_json), status: :ok
  #   else
  #     render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
  #   end
  # end


  # def login
  #   # 로그인시 받은 아이디를 토대로 유저 정보를 찾은 후,
  #   # access_token과 refresh_token을 내려준다.
  #   @user = User.find_by_email params[:email]
  #   if @user&.authenticate params[:password]
  #     make_token
  #     render json: ResponseWrap.data_wrap(@user.as_json.merge(access_token: @access_token)), status: :ok
  #   else
  #     render json: ResponseWrap.data_wrap(nil), status: :unauthorized
  #   end
  # end
  #
  # def show
  #   user = User.find params[:id]
  #   render json: ResponseWrap.data_wrap(user.as_json), status: :ok
  # end
  #
  # def destroy
  #   if @user.update!(status: "unregister")
  #     render json: ResponseWrap.data_wrap(user.as_json), status: :ok
  #   else
  #     render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
  #   end
  # end

  private

  def user_params
    params.permit(:phone, :nickname, :email)
  end

  def social_params
    user_params_for_social = params.permit(:email, :sns, extra: {})
    user_params_for_social.merge(status: 0, password: (('0'..'9').to_a + ('a'..'z').to_a).shuffle.first(20).join)
  end
end