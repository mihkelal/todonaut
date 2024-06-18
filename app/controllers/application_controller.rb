# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  delegate :current_user, to: :helpers, allow_nil: true

  around_action :switch_locale

  private

  def switch_locale(&)
    locale = helpers.current_user_locale
    I18n.with_locale(locale, &)
  end
end
