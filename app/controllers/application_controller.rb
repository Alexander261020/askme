class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def check_captcha
    current_user.present? || verify_recaptcha
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'Вам сюда низя!'
  end
end
