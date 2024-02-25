class Player
  class SessionsController < Devise::SessionsController
    before_action :clear_alerts_for_root_path, only: :new

    def create
      super
      flash.clear
    end

    private

    def clear_alerts_for_root_path
      flash.delete(:alert)
    end
  end
end