# frozen_string_literal: true

class Shared::ContinueReadingComponent < ViewComponent::Base
  attr_reader :resource_url

  def initialize(resource_url:)
    @resource_url = resource_url
  end
end
