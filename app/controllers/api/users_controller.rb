class Api::UsersController < Api::ApplicationController
  # before_action :token_authentication, only: [:show, :destroy]
  #skip_before_action :verify_authenticity_token

  def create
    user = User.user_information_update(user_params)

    # 유저 정보 있는지 체크
    if user.present?
      # 유저 정보 업데이트(폰번호, 닉네임)
      if user.update_attributes(user_params)
        render json: ResponseWrap.data_wrap(user.as_json), status: :ok
      else
        render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
      end
    else
      render json: ResponseWrap.data_wrap(nil, user.errors.details), status: :bad_request
    end
  end

  def naver_login
    # 회원가입 여부 체크
    if User.sign_up_check(naver_params)
      user = User.sign_up_check(naver_params)
      if user.status == User.statuses[:not_phone_certified]
        render json: ResponseWrap.data_wrap(user.as_json), status: :found
      else
        render json: ResponseWrap.data_wrap(user.as_json), status: :ok
      end
    else
      user = User.new(naver_params)
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
    user_params_for_naver = params.permit(:email, extra: {})
    user_params_for_naver.merge(status: 0, sns: User.sns[:naver], password: (('0'..'9').to_a + ('a'..'z').to_a).shuffle.first(20).join)
  end

  def naver_params
    user_params_for_naver = params.permit(:email, extra: {})
    user_params_for_naver.merge(status: 0, sns: User.sns[:naver], password: (('0'..'9').to_a + ('a'..'z').to_a).shuffle.first(20).join)
  end

  def kakao_params
    user_params_for_naver = params.permit(:email, extra: {})
    user_params_for_naver.merge(status: 0, sns: User.sns[:kakao], password: (('0'..'9').to_a + ('a'..'z').to_a).shuffle.first(20).join)
  end

  def facebook_params
    user_params_for_naver = params.permit(:email, extra: {})
    user_params_for_naver.merge(status: 0, sns: User.sns[:face_book], password: (('0'..'9').to_a + ('a'..'z').to_a).shuffle.first(20).join)
  end
end