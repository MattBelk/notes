require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  test "valid login followed by logout" do
    @user = create(:user)

    sign_in @user
    post user_session_path, params: { user: { email: @user.email,
                                              password: @user.password } }
    # Check redirected to appropriate url on login/logout
    assert_redirected_to root_url
    delete destroy_user_session_path
    assert_redirected_to about_url
  end

end
