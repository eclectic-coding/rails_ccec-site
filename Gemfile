source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "rails", "~> 7.1.1"
gem "pg", "~> 1.1"
gem "puma", "~> 6.4.0"
gem "propshaft"
gem "cssbundling-rails", "~> 1.3", ">= 1.3.3"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# === App Gems ======================
gem "devise", "~> 4.9"
gem "devise_invitable", git: "https://github.com/scambra/devise_invitable.git"
gem "friendly_id", "~> 5.4"
gem "name_of_person", "~> 1.1"
gem "noticed", "~> 1.4"
gem "pretender", "~> 0.3.4"
gem "pundit", "~> 2.1"
gem "sidekiq", "~> 7.2"
gem "sitemap_generator", "~> 6.1"
gem "whenever", require: false
gem "rolify"
gem "simple_calendar"
gem "view_component"
gem "view_component-contrib", "~> 0.2.2"
gem "dry-initializer"
gem "dry-effects"
gem "bundle-audit"
gem "coveralls", require: false
gem "pagy"
gem "city-state", git: "https://github.com/eclectic-coding/city-state.git"
# gem "city-state", path: "~/development/projects/city-state"
gem "acts-as-taggable-on"
gem "active_storage_validations", "~> 1.1", ">= 1.1.1"
gem "aws-sdk-s3", require: false
gem "counter_culture", "~> 3.2"
gem "invisible_captcha"
gem "geocoder", "~> 1.8"
gem "groupdate", "~> 6.4"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.1.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "annotate"
end

group :development do
  gem "web-console"
  gem "fuubar", "~> 2.5", ">= 2.5.1"
  gem "letter_opener_web", "~> 2.0"
  gem "brakeman", "~> 6.0", ">= 6.0.1"
  gem "rubocop-rails"
  gem "rubocop"
  gem "rubocop-rspec"
  gem "standard"
  gem "bullet"
  # gem "strong_migrations"
end

group :test do
  gem "simplecov", "~> 0.22.0", require: false
  gem "vcr"
  gem "webmock"
  gem "capybara"
  gem "cuprite"
  gem "test-prof"
end

