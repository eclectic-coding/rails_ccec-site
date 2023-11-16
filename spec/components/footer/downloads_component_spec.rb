# frozen_string_literal: true

require "rails_helper"

RSpec.describe Footer::DownloadsComponent, type: :component do
  xit "renders " do
    render_inline(described_class.new(media_upload: media_upload))

    expect(rendered_component).to have_css("a[href='#{media_upload_path(media_upload)}']")
    expect(rendered_component).to have_css("a[href='#{media_upload_path(media_upload)}']", text: media_upload.name)
    expect(rendered_component).to have_css("a[href='#{media_upload_path(media_upload)}']", text: media_upload.tag_list.join(", "))
  end
end
