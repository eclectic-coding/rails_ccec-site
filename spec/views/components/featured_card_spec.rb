# frozen_string_literal: true

require "rails_helper"
require "base64"

describe FeaturedCard::Component do
  let(:image_path) { Rails.root.join("spec", "support", "assets", "image.png") }
  let(:image_data) { Base64.strict_encode64(File.read(image_path)) }
  let(:image) { MiniMagick::Image.read(image_data) }
  let(:data_url) { "data:image/png;base64,#{image_data}" }

  let(:component) do
    FeaturedCard::Component.new(
      title: "My Title",
      description: "Description",
      image: data_url,
      resource_url: "resource"
    )
  end

  subject { rendered_content }

  it "renders" do
    render_inline(component)
    is_expected.to have_css "div"
  end
end
