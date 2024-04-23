# frozen_string_literal: true

require "rails_helper"

describe "example_component component" do
  it "default preview" do
    visit("/rails/view_components/example_component/default")

    # is_expected.to have_text "Hello!"
    # click_on "Click me"
    # is_expected.to have_text "Good-bye!"
  end
end
