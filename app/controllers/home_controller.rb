class HomeController < ApplicationController
  skip_before_action :authenticate_player!, only: [:index]

  def index
  end
end
