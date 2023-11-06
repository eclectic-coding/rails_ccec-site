# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::UserNavbarComponent, type: :component do
  xit "renders login for no user" do
    render_inline(described_class.new)

    expect(rendered_component).to have_link("Login")
  end
end
