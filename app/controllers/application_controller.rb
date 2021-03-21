class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_action_cable_identifier

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :favorite_sports, :age])
  end

  def set_action_cable_identifier
    cookies.encrypted[:user_id] = current_user&.id
  end

end
