class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_player! 
  before_action :clear_post_signout_alerts

  private

  def clear_post_signout_alerts
    flash.delete(:alert) if session.delete(:sign_out)
  end
end
