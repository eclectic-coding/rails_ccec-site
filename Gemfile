source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

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
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# === App Gems ======================
gem "devise", "~> 4.9"
gem "friendly_id", "~> 5.4"
gem "madmin"
gem "name_of_person", "~> 1.1"
gem "noticed", "~> 1.4"
gem "omniauth-facebook", "~> 8.0"
gem "omniauth-github", "~> 2.0"
gem "omniauth-twitter", "~> 1.4"
gem "pretender", "~> 0.3.4"
gem "pundit", "~> 2.1"
gem "sidekiq", "~> 6.2"
gem "sitemap_generator", "~> 6.1"
gem "whenever", require: false
gem "responders", github: "heartcombo/responders", branch: "main"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "standard", "~> 1.9", require: false
end

group :development do
  gem "web-console"
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
end
