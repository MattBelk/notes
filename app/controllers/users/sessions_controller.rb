# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  before_action :reset_example_user, only: [:create, :destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end


  protected

  def reset_example_user

    if user_signed_in? && current_user.id == 1
      # Case where logging out
      current_user.notes.destroy_all
    elsif params[:user] && params[:user][:email] == "user@example.com"
      # Otherwise user is logging in
      User.first.notes.destroy_all
    end
    
  end




  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
