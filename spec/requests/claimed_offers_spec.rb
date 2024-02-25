require 'rails_helper'

RSpec.describe "ClaimedOffers", type: :request do
  describe "GET /index" do
    before do
      offer_one = create(:offer)
      offer_two = create(:offer)
      player_one = create(:player)
      player_two = create(:player)
      @player_one_claimed_offers = create_list(:claimed_offer, 5, player: player_one, offer: offer_one)
      @player_two_claimed_offers = create_list(:claimed_offer, 5, player: player_two, offer: offer_two)
      sign_in player_one
    end

    it 'displays the claimed offers for the logged player' do
      get "/claimed_offers"

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Claimed Offers")
      @player_one_claimed_offers.each do |claimed_offer|
        expect(response.body).to include(claimed_offer.offer.title)
      end
      @player_two_claimed_offers.each do |claimed_offer|
        expect(response.body).not_to include(claimed_offer.offer.title)
      end
    end
  end

  describe "GET /show" do
    before do
      offer = create(:offer)
      player = create(:player)
      @claimed_offer = create(:claimed_offer, player: player, offer: offer)
      sign_in player
    end

    it 'displays the claimed offer details' do
      get "/claimed_offers/#{@claimed_offer.id}"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(@claimed_offer.offer.title)
      expect(response.body).to include(@claimed_offer.offer.description)
      expect(response.body).to include(@claimed_offer.created_at.strftime("%B %d, %Y"))
    end
  end

  describe "POST /create" do
    before do
      @offer = create(:offer)
      @player = create(:player)
      sign_in @player
    end

    context 'success' do
      it 'creates a claimed offer and redirects to claimed offers page' do
        post "/claimed_offers", params: { offer_id: @offer.id }

        expect(response).to redirect_to(claimed_offers_path)
        expect(flash[:notice]).to eq("Offer claimed successfully")
        expect(ClaimedOffer.count).to eq(1)
      end
    end

    context 'failure' do
      it 'does not create a claimed offer and redirects to offers page' do
        post "/claimed_offers", params: { offer_id: nil }

        expect(response).to redirect_to(offers_path)
        expect(flash[:alert]).to eq("Offer could not be claimed")
        expect(ClaimedOffer.count).to eq(0)
      end
    end
  end
end
