require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
    @other_user = create(:user)
  end
  
  test "destroy should reset first user details" do
    sign_in @user
    # Change details other than email (avoids dealing with confirmation email)
    patch user_registration_path,
            params: { user: { name: "name",
                              email: @user.email,
                              password: "newpassword",
                              password_confirmation: "newpassword",
                              current_password: @user.password } }
    # Change email
    @user.update_columns(email: "u@example.com")
    @user.reload
    # Confirm details changed
    assert_not @user.email == "user@example.com"
    assert_not @user.name == "Example User"
    delete destroy_user_session_path
    @user.reload
    # Confirm details changed back
    assert @user.email == "user@example.com"
    assert @user.name == "Example User"
    # Attempt login with old password
    post user_session_path, params: { user: { email: @user.email,
                                              password: "newpassword" } }
    assert_template 'users/sessions/new'
    # Login with reset password
    post user_session_path, params: { user: { email: @user.email,
                                              password: "password" } }
    # Check user logged in by accessing page restricted by devise
    get edit_user_registration_path
    assert_template 'users/registrations/edit'
  end

  test "destroy should reset first user notes" do
  end

end
