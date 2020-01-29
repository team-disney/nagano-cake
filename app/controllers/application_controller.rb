class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        root_path
	end
    # registration のstrong parameters
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :email, :password, :encrypted_password])
    end
end
