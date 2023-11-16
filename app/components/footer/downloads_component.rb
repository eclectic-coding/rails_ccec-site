# frozen_string_literal: true

class Footer::DownloadsComponent < ViewComponent::Base
  with_collection_parameter :media_upload

  def initialize(media_upload:)
    @media_upload = media_upload
  end
end
