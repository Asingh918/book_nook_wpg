class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    if super.is_a?(Hash)
      sign_out
      nil
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street, :city, :postal_code, :province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street, :city, :postal_code, :province_id])
  end
end
