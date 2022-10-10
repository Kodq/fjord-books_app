# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:postalcode, :address,:introduction])
    end
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        user_path(resource)
    end
end
