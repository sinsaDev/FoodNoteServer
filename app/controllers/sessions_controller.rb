class SessionsController < ApplicationController

  def login
    redirect_to admin_users_path if session[:user_id].present?
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to admin_users_path
    else
      flash.alert = "유효하지않은 이메일 or 비밀번호입니다."
      redirect_to login_sessions_path
    end
  end
end