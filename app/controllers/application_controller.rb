class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name) ) 
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name))
  end


  private

  def after_sign_out_path_for(resource_or_scope)
    about_path
  end

end
