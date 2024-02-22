require "rails_helper"
require "rake"
# require "vcr"

describe "update_cities:update" do
  before :all do
    Rake.application.rake_require "tasks/update_cities"
    Rake::Task.define_task(:environment)
  end

  let :run_rake_task do
    Rake::Task["update_cities:update"].reenable
    Rake.application.invoke_task "update_cities:update"
  end

  it "should update cities" do
    VCR.use_cassette("update_cities") do
      run_rake_task
    end
  end
end
