class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!

	def self.get_nfl_data(api_string)
        puts "/******get_nfl_data****"
        puts "/*****api_string, #{api_string.inspect}"
        HTTParty.get(api_string)
    end

	def after_sign_in_path_for(resrouce)
		"/"
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {
			|u| u.permit({ roles: [] }, :first_name, :last_name, :username, :email, :password, :password_confirmation)
		}
	end
end
