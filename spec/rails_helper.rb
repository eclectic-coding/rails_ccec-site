require "simplecov"

SimpleCov.start "rails" do
  add_filter "/app/channels/"
  add_filter "/app/jobs/"
  add_filter "/lib/tasks/"
end

require "spec_helper"

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "fuubar"
require "pundit/rspec"
require_relative "rspec_screenshot_patch"
# require "webmock/rspec"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false # use Database Cleaner instead
  # config.filter_run_excluding type: "system"
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers # helpers for system tests
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :component
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.include RspecScreenshotHelperPatch, type: :system
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.filter_gems_from_backtrace("capybara", "cuprite", "ferrum")
  config.fuubar_progress_bar_options = { format: "Completed Tests <%B> %p%% %a" }
end
