require "rails_helper"

RSpec.describe "Admin::Addresses", type: :request do
  let(:valid_attributes) { attributes_for(:address) }

  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_addresses_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get admin_address_path(create(:address))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_admin_address_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      address = Address.create! valid_attributes
      get edit_admin_address_path(address)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Address" do
        expect {
          post admin_addresses_path, params: { address: valid_attributes }
        }.to change(Address, :count).by(1)
      end

      it "redirects to the created address" do
        post admin_addresses_path, params: { address: valid_attributes }
        expect(response).to redirect_to(admin_addresses_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address with no name" do
        expect {
          post admin_addresses_path, params: { address: {
            name: "", street: "Street", city: "City"
          } }
        }.to change(Address, :count).by(0)
      end

      it "does not create a new Address with no street" do
        expect {
          post admin_addresses_path, params: { address: {
            name: "Name", street: "", city: "City"
          } }
        }.to change(Address, :count).by(0)
      end

      it "does not create a new Address with no city" do
        expect {
          post admin_addresses_path, params: { address: {
            name: "Name", street: "Street", city: ""
          } }
        }.to change(Address, :count).by(0)
      end

      it "renders the new form" do
        post admin_addresses_path, params: { address: { name: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "New Name" } }

      it "updates the requested address" do
        address = Address.create! valid_attributes
        put admin_address_path(address), params: { address: new_attributes }
        address.reload
        expect(address.name).to eq("New Name")
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        put admin_address_path(address), params: { address: new_attributes }
        address.reload
        expect(response).to redirect_to(admin_address_path(address))
      end
    end

    context "with invalid parameters" do
      it "renders the edit form" do
        address = Address.create! valid_attributes
        put admin_address_path(address), params: { address: { name: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DESTROY /destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete admin_address_path(address)
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the addresses list" do
      address = Address.create! valid_attributes
      delete admin_address_path(address)
      expect(response).to redirect_to(admin_addresses_path)
    end
  end
end
