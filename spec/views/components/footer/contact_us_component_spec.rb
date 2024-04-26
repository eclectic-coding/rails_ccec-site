# frozen_string_literal: true

require "rails_helper"

RSpec.describe Footer::ContactUs::Component, type: :component do
  it "renders the contact us" do
    render_inline(described_class.new)

    expect(page).to have_content("Contact Us")
  end
end
