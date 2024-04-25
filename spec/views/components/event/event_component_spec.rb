# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::EventComponent, type: :component do
  it "renders the event" do
    event = create(:event, event_type: "gathering")
    render_inline(Event::EventComponent.new(event: event))

    expect(rendered_content).to have_text(event.name)
  end
end
