require 'rails_helper'

RSpec.describe "ClaimedOffers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/claimed_offers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/claimed_offers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
