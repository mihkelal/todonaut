# frozen_string_literal: true

Recaptcha.configure do |config|
  config.secret_key = Rails.application.credentials.dig(:recaptcha, :secret_key)
  config.site_key = Rails.application.credentials.dig(:recaptcha, :site_key)
end
