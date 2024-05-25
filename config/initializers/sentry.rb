# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.dsn = Rails.application.credentials.dig(:sentry, :dsn)
  config.enabled_environments = %w[production]
  config.excluded_exceptions += ['ActionController::RoutingError', 'ActiveRecord::RecordNotFound']
  config.send_default_pii = true
  config.profiles_sample_rate = 0.2
  config.traces_sample_rate = 0.2
  config.traces_sampler = lambda do |sampling_context|
    # transaction_context is the transaction object in hash form
    # keep in mind that sampling happens right after the transaction is initialized
    # for example, at the beginning of the request
    transaction_context = sampling_context[:transaction_context]

    # transaction_context helps you sample transactions with more sophistication
    # for example, you can provide different sample rates based on the operation or name
    op = transaction_context[:op]
    transaction_name = transaction_context[:name]

    case op
    when /http/
      case transaction_name
      when '/up'
        0.0 # ignore health_check requests
      else
        0.2
      end
    else
      0.0 # ignore all other transactions
    end
  end
end
