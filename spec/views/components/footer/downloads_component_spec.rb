# frozen_string_literal: true

require "rails_helper"

RSpec.describe Footer::Downloads::Component, type: :component do
  include Rails.application.routes.url_helpers

  it "renders " do
    media_uploads = create_list(:media_upload, 3)
    render_inline(described_class.new(media_upload: media_uploads))

    expect(rendered_content).to have_css("a", text: media_uploads.first.name)
    expect(rendered_content).to have_css("a[href='#{rails_blob_path(media_uploads.first.media_file_attachment, disposition: "preview")}']")
  end
end
