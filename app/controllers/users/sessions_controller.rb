# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # before_action :reset_example_user, only: [:destroy]

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
    user = current_user
    if user.id == 1
      # user.reset_password("password", "password")
      # user.update_columns(email: "user@example.com", name: "Example User")

      # Reset user's notes
    end
  end




  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
