# frozen_string_literal: true

require "webmock/rspec"

RSpec.configure do |config|
  config.before(:all, type: :request) do
    WebMock.allow_net_connect!
  end

  config.before(:all, type: :system) do
    WebMock.allow_net_connect!
  end

  config.after(:all, type: :request) do
    selenium_requests = %r{/((__.+__)|(hub/session.*))$}
    WebMock.allow_net_connect! allow: selenium_requests
  end

  config.before(:each) do
    stub_request(:any, /maps.googleapis.com/).to_return(
      body: { results: [{ geometry: { location: { lat: 35.12345, lng: -80.12345 } } }] }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  config.before(:each) do
    allow_any_instance_of(Address).to receive(:geocode).and_return([35.12345, -80.12345])
  end
end
