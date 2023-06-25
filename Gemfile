source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# === App Gems ======================
gem "devise", "~> 4.9"
gem "devise_invitable"
gem "friendly_id", "~> 5.4"
gem "name_of_person", "~> 1.1"
gem "noticed", "~> 1.4"
gem "pretender", "~> 0.3.4"
gem "pundit", "~> 2.1"
gem "sidekiq", "~> 6.2"
gem "sitemap_generator", "~> 6.1"
gem "whenever", require: false
gem "rolify"
gem "simple_calendar"
gem "haml-rails", "~> 2.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "webdrivers"
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "annotate"
end

group :development do
  gem "web-console"
  gem "fuubar", "~> 2.5", ">= 2.5.1"
  gem "letter_opener_web", "~> 2.0"
  gem "overcommit"
  # gem "strong_migrations"
end

group :test do
  gem "simplecov", "~> 0.21.2", require: false
  gem "webmock"
end

group :development do
  eval_gemfile "gemfiles/rubocop.gemfile"
end
