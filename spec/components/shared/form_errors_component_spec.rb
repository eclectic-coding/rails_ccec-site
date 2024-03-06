# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::FormErrorsComponent, type: :component do
  it "renders form error" do
    resource = MediaUpload.new
    resource.valid?
    key = :name

    render_inline(described_class.new(resource: resource, key: key))

    expect(rendered_content).to have_css("div.error", text: "Name can't be blank")
  end
end
