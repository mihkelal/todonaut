# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  delegate :current_user, to: :helpers, allow_nil: true

  rescue_from Pundit::NotAuthorizedError, with: :redirect_user_back

  private

  def redirect_user_back
    redirect_back(fallback_location: root_path, alert: t('global.not_authorized'))
  end
end
