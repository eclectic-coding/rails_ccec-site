require "rails_helper"

RSpec.describe AvatarHelper, type: :helper do
  describe "returns users avatar" do
    it "builds url" do
      user = create(:user)
      expect(helper.avatar_path(user)).to eq("https://secure.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=180&d=mp")
    end
  end
end
