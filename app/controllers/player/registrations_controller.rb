# frozen_string_literal: true

class Player
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:create]

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age gender email password password_confirmation])
    end
  end
end