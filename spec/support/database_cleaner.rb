RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  # rubocop:disable RSpec/HookArgument
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :system) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  # rubocop:enable RSpec/HookArgument
end
