# frozen_string_literal: true

require "rails_helper"

RSpec.describe Footer::EventsComponent, type: :component do
  it "renders the events component" do
    events = create_list(:event, 3, event_type: :gathering)
    render_inline(described_class.new(events: events))

    expect(rendered_content).to have_css("h2", text: "Upcoming Events")
  end

  it "renders the events component with no events" do
    render_inline(described_class.new(events: nil))

    expect(rendered_content).to have_css("p", text: "No events found")
  end
end
