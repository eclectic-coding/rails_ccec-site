# frozen_string_literal: true

require "rails_helper"

describe ExampleComponent::Component do
  let(:options) { {} }
  let(:component) { ExampleComponent::Component.new(**options) }

  subject { rendered_content }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "div"
  end
end