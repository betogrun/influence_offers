class OffersController < ApplicationController
  def index
    @pagy, @offers = pagy(
      Offer.
        not_claimed_by(current_player).
        by_demographics(current_player.gender, current_player.age),
      items: 10
    )
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
