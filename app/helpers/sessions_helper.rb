# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session.key?(:user_id)
  end

  def current_user_locale
    current_user&.locale || session[:locale] || I18n.default_locale
  end

  def other_locales
    I18n.available_locales.without(current_user_locale.to_sym)
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
  end
end
