class OffersController < ApplicationController
  def index
    @offers = Offer.by_demographics(current_player.gender, current_player.age)
  end

  def show
  end
end
