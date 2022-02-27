class ApplicationController < ActionController::Base

  # In order to save added fields in schema
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :surname, :email, :password, :current_password)}
  end

end
