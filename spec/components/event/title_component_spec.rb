# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::TitleComponent, type: :component do
  describe "rendering the event title" do
    it "renders the event title" do
      event = create(:event, event_type: "gathering")
      render_inline(described_class.new(event: event))

      expect(rendered_content).to include("MyString")
    end

    it "renders the event title with a walk number if it is a weekend event" do
      event = create(:event, event_type: "weekend", walk_number: "123")
      render_inline(described_class.new(event: event))

      expect(rendered_content).to include("MyString 123")
    end
  end
end
