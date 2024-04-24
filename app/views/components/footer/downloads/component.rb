# frozen_string_literal: true

class Footer::Downloads::Component < ApplicationViewComponent
  with_collection_parameter :media_upload
  option :media_upload
end
