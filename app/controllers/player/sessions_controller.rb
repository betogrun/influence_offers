class Player
  class SessionsController < Devise::SessionsController
    before_action :clear_alerts_for_root_path, only: :new

    def create
      super
      flash.clear
    end

    def destroy
      super
      session[:sign_out] = true
    end

    private

    def clear_alerts_for_root_path
      flash.delete(:alert) if request.referer.nil? || request.referer.ends_with?(root_url) 
    end
  end
end