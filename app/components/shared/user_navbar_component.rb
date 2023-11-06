# frozen_string_literal: true

class Shared::UserNavbarComponent < ViewComponent::Base
  attr_reader :user

  include Devise::Controllers::Helpers

  def initialize(user: nil)
    @user = user
  end
end
