require "rails_helper"

RSpec.describe BootstrapHelper, type: :helper do
  describe "returns the correct bootstrap class for flash type" do
    it "returns alert-success for success" do
      expect(helper.bootstrap_class_for(:success)).to eq("alert-success")
    end

    it "returns alert-danger for error" do
      expect(helper.bootstrap_class_for(:error)).to eq("alert-danger")
    end

    it "returns alert-warning for alert" do
      expect(helper.bootstrap_class_for(:alert)).to eq("alert-warning")
    end

    it "returns alert-primary for notice" do
      expect(helper.bootstrap_class_for(:notice)).to eq("alert-primary")
    end

    it "returns the flash type if not found" do
      expect(helper.bootstrap_class_for(:foo)).to eq("foo")
    end
  end
end
