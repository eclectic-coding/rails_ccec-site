require "spec_helper"
require "simplecov"
SimpleCov.start "rails" do
  add_filter "/app/jobs/"
  add_filter "/app/channels/"
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "capybara/rails"
require "fuubar"
require "pundit/rspec"
require "webmock/rspec"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.before(:all, type: :request) do
    WebMock.allow_net_connect!
  end

  config.after(:all, type: :request) do
    selenium_requests = %r{/((__.+__)|(hub/session.*))$}
    WebMock.allow_net_connect! allow: selenium_requests
  end

  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers # helpers for system tests
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.fuubar_progress_bar_options = { format: "Completed Tests <%B> %p%% %a" }
end
