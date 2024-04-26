# frozen_string_literal: true

class BannerMessage::Component < ApplicationViewComponent
  attr_reader :shortname

  def initialize(shortname:)
    @shortname = shortname
    @editable = GetEditable.new.call(shortname)
  end

  def message
    @editable.content if @editable.present? && @editable.active?
  end

  def render?
    @editable.present? && @editable.active?
  end

end
