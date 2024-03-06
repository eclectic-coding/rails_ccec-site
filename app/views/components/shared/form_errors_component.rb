# frozen_string_literal: true

class Shared::FormErrorsComponent < ViewComponent::Base
  attr_reader :resource, :key

  def initialize(resource:, key:)
    @resource = resource
    @key = key
  end
end
