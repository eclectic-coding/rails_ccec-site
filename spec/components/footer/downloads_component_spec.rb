# frozen_string_literal: true

require "rails_helper"

RSpec.describe Footer::DownloadsComponent, type: :component do
  include Rails.application.routes.url_helpers

  it "renders " do
    media_upload = create(:media_upload)
    render_inline(described_class.new(media_upload: media_upload))

    expect(rendered_content).to have_css("a", text: media_upload.name)
    expect(rendered_content).to have_css("a[href='#{rails_blob_path(media_upload.media_file, disposition: "attachment")}']")
  end
end
