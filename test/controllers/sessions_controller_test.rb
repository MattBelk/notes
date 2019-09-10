require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @first_user = create(:user_with_notes, notes_count: 5)
    @second_user = create(:user_with_notes, notes_count: 5)
  end

  test "create should reset first user's notes" do
    post user_session_path,
          params: { user: { email: @first_user.email,
                            password: @first_user.password } }
    assert_equal 0, @first_user.notes.count

    sign_out @first_user

    post user_session_path,
          params: { user: { email: @second_user.email,
                            password: @second_user.password } }
    assert_equal 5, @second_user.notes.count
  end

  test "destroy should reset first user's notes" do
    sign_in @first_user

    assert_equal 5, @first_user.notes.count
    delete destroy_user_session_path
    assert_equal 0, @first_user.notes.count

    sign_out @first_user

    sign_in @second_user
    
    delete destroy_user_session_path
    assert_equal 5, @second_user.notes.count
  end

end
