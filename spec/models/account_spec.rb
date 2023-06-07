require "rails_helper"

RSpec.describe Account, type: :model do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end


end
