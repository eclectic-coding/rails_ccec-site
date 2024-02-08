# frozen_string_literal: true

class FeaturedCardComponent < ViewComponent::Base
  attr_reader :title, :description, :image, :resource_url

  def initialize(title:, description:, image:, resource_url:)
    @title = title
    @description = description
    @image = image
    @resource_url = resource_url
  end
end
