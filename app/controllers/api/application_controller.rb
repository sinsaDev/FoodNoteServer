class Api::ApplicationController < ActionController::Base

  def token_authentication
    token = request.headers["Authorization"]
    if token.to_s.split(" ").size > 3
      refresh_token = token.to_s.split(" ").last
      hash = JsonWebToken.decode(refresh_token)
      user = User.find(hash[:user_id])
      # 사용자가 보낸 토큰과 db상에 저장된 refresh_token이 일치하는 경우
      if user.extra[:refresh_token].to_s == refresh_token
        # 만약 저장된 토큰이 만료되었을 경우
        if Time.zone.now < hash[:exp]
          new_refesh_token = JsonWebToken.refresh_token_encode(user_id: user.id)
          user.extra.delete(:refresh_token)
          user.extra.merge!(refresh_token: new_refesh_token)
        end
      else
        # 유효하지 않는 토큰으로 로그아웃 시킵니다
        render json: ResponseWrap.data_wrap(nil), status: :unauthorized
      end
    else
      begin
        access_token = token.to_s.split(" ").second
        hash = JsonWebToken.decode(access_token)
        @login_user = User.find_by_id(hash)
      rescue JWT::ExpiredSignature => e
        render json: ResponseWrap.data_wrap(nil, e.message), status: :unauthorized
      rescue => e
        render json: ResponseWrap.data_wrap(nil, e.message), status: :unauthorized
      end
    end
  end

  def user_params
    params.permit(:email, :password, :name, :nickname)
  end
end
