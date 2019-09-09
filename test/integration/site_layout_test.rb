require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
  end
  
  test "logged out layout links" do
    get root_path
    assert_redirected_to about_url
    follow_redirect!
    assert_template 'static_pages/about'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "span.home-scroll", count: 0
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", "https://github.com/MattBelk/notes", count: 2
    assert_select "a[href=?]", "https://github.com/MattBelk", count: 2
    assert_select "a[href=?]", new_user_registration_path, count: 2
    assert_select "a[href=?]", new_user_session_path, count: 2
  end

  test "logged in layout links" do
    sign_in @user
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 0
    assert_select "span.home-scroll", count: 2
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", "https://github.com/MattBelk/notes", count: 1
    assert_select "a[href=?]", "https://github.com/MattBelk", count: 1
    assert_select "a[href=?]", new_user_registration_path, false
    assert_select "a[href=?]", new_user_session_path, false
    assert_select "a[href=?]", destroy_user_session_path, count: 1
    assert_select "a[href=?]", edit_user_registration_path, count: 1
  end

end
