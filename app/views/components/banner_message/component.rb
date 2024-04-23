# frozen_string_literal: true

class BannerMessage::Component < ApplicationViewComponent
  option :shortname

  def message
    editable = GetEditable.new.call(shortname)
    editable.content if editable.active?
  end
end
