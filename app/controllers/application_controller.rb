class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name) ) 
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name))
  end


  private

  def after_sign_out_path_for(resource_or_scope)
    about_path
  end

  def record_not_found
    flash[:alert] = "Record not found"
    redirect_to root_url
  end

  def correct_note_user
    @note = Note.find(params[:id])
    unless current_user.id == @note.user_id
      redirect_to root_url 
    end
  end
  
end
