require 'rails_helper'

RSpec.describe "Offers", type: :request do
  describe "GET /index" do

    context 'when there are offers not claimed by the current player' do
      before do
        @player = create(:player)
        @offers = create_list(:offer, 3)
        sign_in @player
      end

      it 'displays the offers' do
        get "/offers"

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include("No offers found.")
        @offers.each do |offer|
          expect(response.body).to include(offer.title)
        end
      end
    end

    context 'when there are offers claimed by the current player' do
      before do
        @player = create(:player)
        @offers = create_list(:offer, 3)
        @offers.each { |offer| create(:claimed_offer, player: @player, offer: offer) } 
        sign_in @player
      end

      it 'does not display the offers' do
        get "/offers"

        expect(response).to have_http_status(:success)
        expect(response.body).to include("No offers found.")
        @offers.each do |offer|
          expect(response.body).not_to include(offer.title)
        end
      end
    end

    context 'when there are offers that match the current player age and gender' do
      before do
        @player = create(:player, age: 30, gender: 'male')
        @offers = [
          create(:offer, target_gender: 'male', target_range_age: (20..40)),
          create(:offer, target_gender: 'all', target_range_age: (0..100)),
          create(:offer, target_gender: 'male', target_range_age: (30..40))
        ]
        sign_in @player
      end

      it 'displays the offers' do
        get "/offers"

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include("No offers found.")
        @offers.each do |offer|
          expect(response.body).to include(offer.title)
        end
      end

    end

    context 'when there are no offers that match the current player age and gender' do
      before do
        @player = create(:player, age: 30, gender: 'male')
        @offers = [
          create(:offer, target_gender: 'female', target_range_age: (20..40)),
          create(:offer, target_gender: 'all', target_range_age: (0..10)),
          create(:offer, target_gender: 'male', target_range_age: (50..60)),
          create(:offer, target_gender: 'female', target_range_age: (50..60))
        ]
        sign_in @player
      end

      it 'does not display the offers' do
        get "/offers"

        expect(response).to have_http_status(:success)
        expect(response.body).to include("No offers found.")
        @offers.each do |offer|
          expect(response.body).not_to include(offer.title)
        end
      end
    end

    context 'when there are offers that match the current player age and gender but were claimed by the current player' do
      before do
        @player = create(:player, age: 30, gender: 'male')
        @offers = [
          create(:offer, target_gender: 'male', target_range_age: (20..40)),
          create(:offer, target_gender: 'all', target_range_age: (0..100)),
          create(:offer, target_gender: 'male', target_range_age: (30..40))
        ]
        @offers.each { |offer| create(:claimed_offer, player: @player, offer: offer) } 
        sign_in @player

      end

      it 'does not display the offers' do
        get "/offers"

        expect(response).to have_http_status(:success)
        expect(response.body).to include("No offers found.")
        @offers.each do |offer|
          expect(response.body).not_to include(offer.title)
        end
      end
    end
  end

  describe "GET /show" do
    before do
      @offer = create(:offer)
      player = create(:player)
      sign_in player
    end

    it 'displays the offer' do
      get "/offers/#{@offer.id}"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(@offer.title)
      expect(response.body).to include(@offer.description)
      expect(response.body).to include("Claim!")
      expect(response.body).to include("Back to Offers")
    end
  end
end
