require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = build(:user)
  end

  test "invalid name with devise signup" do
    get new_user_registration_path
    assert_select 'form[action=?]', user_registration_path
    assert_no_difference "User.count" do
      post user_registration_path, 
            params: {user: { name: "",
                             email: @user.email,
                             password: @user.password,
                             password_confirmation: @user.password } }
    end
    assert_template 'users/registrations/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    get new_user_registration_path
    assert_no_difference "User.count" do
      post user_registration_path, 
            params: {user: { name: "a" * (User::MAX_NAME_LENGTH + 1),
                             email: @user.email,
                             password: @user.password,
                             password_confirmation: @user.password } }
    end
    assert_template 'users/registrations/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with devise signup" do
    # Check name attribute works alongside devise
    assert_difference "User.count", 1 do
      post user_registration_path,
            params: {user: { name: @user.name,
                             email: @user.email,
                             password: @user.password,
                             password_confirmation: @user.password } }
    end
  end

end
