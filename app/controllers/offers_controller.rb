class OffersController < ApplicationController
  def index
    @offers = Offer.by_demographics(current_player.gender, current_player.age)
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
