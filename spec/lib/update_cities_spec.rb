require "rails_helper"
require "rake"
# require "vcr"

describe "update_cities:update" do
  before :all do
    Rake.application.rake_require "tasks/update_cities"
    Rake::Task.define_task(:environment)
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  let :run_rake_task do
    Rake::Task["update_cities:update"].reenable
    Rake.application.invoke_task "update_cities:update"
  end

  it "should update cities" do
    # Stub the method that makes the request to the external API
    stub_request(:get, "http://api.example.com").to_return(body: 'your_stubbed_response')

    run_rake_task
  end
end
