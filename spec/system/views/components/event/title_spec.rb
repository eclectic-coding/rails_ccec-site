# frozen_string_literal: true

require "rails_helper"

describe "title component" do
  it "default preview" do
    visit("/rails/view_componentsevent/title/default")

    # is_expected.to have_text "Hello!"
    # click_on "Click me"
    # is_expected.to have_text "Good-bye!"
  end
end
