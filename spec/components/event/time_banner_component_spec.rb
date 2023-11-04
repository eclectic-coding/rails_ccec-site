# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::TimeBannerComponent, type: :component do
  it "renders an event date" do
    render_inline(described_class.new(event: Event.new(start_time: Time.zone.now)))

    expect(rendered_content).to include(Time.zone.now.strftime("%B %d"))
  end

  it "renders an event with ending date if it has one" do
    render_inline(described_class.new(event: Event.new(start_time: Time.zone.now, end_time: Time.zone.now + 72.hours)))

    expect(rendered_content).to include(Time.zone.now.strftime("%B %d"))
  end
end
