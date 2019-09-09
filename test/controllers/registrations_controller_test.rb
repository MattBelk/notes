require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @first_user = create(:user)
    @second_user = create(:user)
  end
  
  test "should not delete first user" do
    sign_in @first_user
    get edit_user_registration_path
    assert_no_difference "User.count" do
      delete user_registration_path
    end
    assert_template 'users/registrations/edit'
    assert_select 'div.alert-danger'
    sign_out @first_user
    sign_in @second_user
    assert_difference "User.count", -1 do
      delete user_registration_path
    end
  end


end
