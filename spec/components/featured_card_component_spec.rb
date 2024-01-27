# frozen_string_literal: true

require "rails_helper"

RSpec.describe FeaturedCardComponent, type: :component do
  describe "outputs featured card UI" do
    let(:featured_card) {
      FeaturedCardComponent.new(title: "Test Title", description: "Test Description",
                                image: Rails.root.join("spec", "support", "assets", "image.png").to_s, resource_url: "/test_url")
    }

    it "renders the featured card title" do
      expect(render_inline(featured_card).to_html).to include("Test Title")
    end

    it "renders the featured card description" do
      expect(render_inline(featured_card).to_html).to include("Test Description")
    end

    it "renders the featured card image" do
      expect(render_inline(featured_card).to_html).to include("image.png")
    end

    it "renders the featured card resource URL" do
      expect(render_inline(featured_card).to_html).to include(featured_card.resource_url)
    end
  end
end
