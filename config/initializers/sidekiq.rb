# frozen_string_literal: true

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end