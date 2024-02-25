class ClaimedOffersController < ApplicationController
  def index
    @pagy, @claimed_offers = pagy(ClaimedOffer.where(player_id: current_player.id).includes(:offer), items: 10)
  end

  def show
    @claimed_offer = ClaimedOffer.includes(:offer).find(params[:id])
  end

  def create
    @claimed_offer = ClaimedOffer.new(player_id: current_player.id, offer_id: permitted_params[:offer_id])
    if @claimed_offer.save
      redirect_to claimed_offers_path, notice: "Offer claimed successfully"
    else
      redirect_to offers_path(id: params[:offer_id]), alert: "Offer could not be claimed"
    end
  end

  private

  def permitted_params
    params.permit(:offer_id)
  end
end
