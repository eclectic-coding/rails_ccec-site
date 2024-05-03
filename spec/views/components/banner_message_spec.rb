# frozen_string_literal: true

require "rails_helper"
require "base64"

describe BannerMessage::Component do
  let(:shortname) { "shortname" }
  let(:editable) { create(:editable, shortname: shortname) }
  let(:component) { BannerMessage::Component.new(shortname: shortname) }

  subject { render_inline(component) }

  context "when the editable is active" do
    before { editable.poly_actives.first&.update(active: true)}

    it "renders the message" do
      is_expected.to have_text(editable.content)
    end
  end

  context "when the editable is inactive" do
    before { editable.poly_actives.first&.update(active: false)}

    it "does not render the message" do
      is_expected.not_to have_text(editable.content)
    end
  end

  context "when the editable does not exist" do
    it "does not render the message" do
      is_expected.not_to have_text(editable.content)
    end
  end
end
