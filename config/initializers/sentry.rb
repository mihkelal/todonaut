# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.dsn = Rails.application.credentials.dig(:sentry, :dsn)
  config.enabled_environments = %w[production]
  config.excluded_exceptions += ['ActionController::RoutingError', 'ActiveRecord::RecordNotFound']
  config.send_default_pii = true
  config.traces_sample_rate = 0.2
  config.profiles_sample_rate = 0.2
end
