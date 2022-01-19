class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def render404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

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
