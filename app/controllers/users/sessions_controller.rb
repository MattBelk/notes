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
    user = current_user
    if user.id == 1
      user.notes.destroy_all
    end
  end




  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
