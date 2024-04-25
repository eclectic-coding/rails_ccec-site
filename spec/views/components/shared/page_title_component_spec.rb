# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::PageTitle::Component, type: :component do
  it "renders a title" do
    render_inline(described_class.new(title: "My Title"))

    expect(rendered_content).to include("My Title")
  end

  it "renders a title with a block" do
    render_inline(described_class.new(title: "My Title")) do
      "My Block"
    end

    expect(rendered_content).to include("My Title")
    expect(rendered_content).to include("My Block")
  end
end
