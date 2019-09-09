require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @first_user = create(:user)
    @second_user = create(:user)
  end
  
  test "should not delete first user" do
    sign_in @first_user
    assert_no_difference "User.count" do
      delete user_registration_path
    end
    assert_redirected_to edit_user_registration_path
    sign_out @first_user
    # Ensure deleting any other user works
    sign_in @second_user
    assert_difference "User.count", -1 do
      delete user_registration_path
    end
  end

  test "should not update first user" do
    sign_in @first_user
    patch user_registration_path,
              params: { user: { name: "name",
                                email: "u@example.com",
                                password: "newpassword",
                                password_confirmation: "newpassword",
                                current_password: @first_user.password } }
    assert_redirected_to edit_user_registration_path
    sign_out @first_user
    # Ensure updating any other user works
    sign_in @second_user
    patch user_registration_path,
              params: { user: { name: "name",
                                email: "u@example.com",
                                password: "newpassword",
                                password_confirmation: "newpassword",
                                current_password: @second_user.password } }
    assert_redirected_to root_url
  end

end
