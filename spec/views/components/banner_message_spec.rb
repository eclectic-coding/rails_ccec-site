# frozen_string_literal: true

require "rails_helper"

describe BannerMessage::BannerMessageComponent do
  let(:options) { {} }
  let(:component) { BannerMessage::BannerMessageComponent.new(**options) }

  subject { rendered_content }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "div"
  end
end
