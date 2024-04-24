# frozen_string_literal: true

require "rails_helper"

describe Footer::ContactUs::Component do
  let(:options) { {} }
  let(:component) { Footer::ContactUs::Component.new(**options) }

  subject { rendered_content }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "div"
  end
end
