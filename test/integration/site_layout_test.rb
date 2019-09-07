require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_redirected_to about_url
    follow_redirect!
    assert_template 'static_pages/about'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", "https://github.com/MattBelk/notes", count: 2
    assert_select "a[href=?]", "https://github.com/MattBelk", count: 1
    assert_select "a[href=?]", new_user_registration_path, count: 1
    assert_select "a[href=?]", new_user_session_path, count: 1
  end

end
