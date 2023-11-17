require "rails_helper"

RSpec.describe Role, type: :model do
  describe "roles" do
    it "outputs a humanized name" do
      role = create(:role, name: "admin")
      expect(role.human_name).to eq("Admin")
    end
  end
end
