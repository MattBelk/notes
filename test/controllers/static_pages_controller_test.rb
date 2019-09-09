require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
  end
  
  test "should get root/home" do
    get root_path
    assert_redirected_to about_url
    sign_in @user
    get root_path
    assert_response :success
    assert_select "title", full_title
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", full_title("About")
  end

end
