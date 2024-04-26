# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::ContinueReading::Component, type: :component do
  it "renders correct link" do
    render_inline(described_class.new(resource_url: "https://example.com"))

    expect(rendered_content).to have_link(nil, href: "https://example.com")
  end
end
