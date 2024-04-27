# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Address::Component, type: :component do
  it "renders the address" do
    event = create(:event, event_type: :gathering, address: create(:address))

    # Stub the method responsible for making the external API call
    allow_any_instance_of(Address).to receive(:geocode).and_return([1, 1])

    render_inline(described_class.new(event: event))

    expect(page).to have_content(event.address.name)
    expect(page).to have_content(event.address.city)
    expect(page).to have_content(event.address.state)
  end
end
