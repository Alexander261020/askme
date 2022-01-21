class ApplicationController < ActionController::Base
  helper_method :current_user, :tags_string

  private

  def tags_string(tags)
    tags.map do |tag|
      "<a href='#{tag_path(tag[:text])}'>#{tag[:text]}</a>"
    end.join(" | ")
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
