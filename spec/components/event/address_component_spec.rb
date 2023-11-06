# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::AddressComponent, type: :component do
  it "renders the address" do
    event = create(:event, event_type: :gathering, address: create(:address))
    render_inline(described_class.new(event: event))

    expect(page).to have_content(event.address.name)
    expect(page).to have_content(event.address.city)
    expect(page).to have_content(event.address.state)
  end
end
