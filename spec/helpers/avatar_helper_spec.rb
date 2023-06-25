require "rails_helper"

RSpec.describe AvatarHelper, type: :helper do
  describe "returns users avatar" do
    it "builds url" do
      stub_request(:get, "https://secure.gravatar.com/avatar/")
        .with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" })
        .to_return(status: 200, body: "stubbed response", headers: {})

      expect(helper.avatar_path(create(:user))).to be_instance_of(String)
    end
  end
end
