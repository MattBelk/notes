require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal full_title, "Notes"
    assert_equal full_title("Some String"), "Some String | Notes"
  end

end