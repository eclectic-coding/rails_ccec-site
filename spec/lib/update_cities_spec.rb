require "rails_helper"
require "rake"

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
    allow(CS).to receive(:update) # Stub CS.update method
    run_rake_task
    expect(CS).to have_received(:update).twice # Assert that CS.update was called
  end
end
