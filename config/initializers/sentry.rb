Sentry.init do |config|
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.dsn = Rails.application.credentials.sentry[:dsn]
  config.enabled_environments = %w[production]
  config.excluded_exceptions = []
  config.send_default_pii = true
  config.traces_sample_rate = 1
end