class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id].present?
      user = User.find_by(id: session[:user_id])
      @current_user ||= user
    else
      @current_user = nil
    end
  end
end
