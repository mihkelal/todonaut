# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  delegate :current_user, to: :helpers, allow_nil: true

  rescue_from Pundit::NotAuthorizedError, with: :redirect_user_back

  around_action :switch_locale

  private

  def redirect_user_back
    redirect_back(fallback_location: root_path, alert: t('global.not_authorized'))
  end

  def switch_locale(&)
    locale = helpers.current_user_locale
    I18n.with_locale(locale, &)
  end
end
