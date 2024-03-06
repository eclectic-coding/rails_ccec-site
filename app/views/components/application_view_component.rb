class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include Dry::Effects.Reader(:current_user, default: nil)
end
