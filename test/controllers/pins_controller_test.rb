require 'test_helper'

class PinsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @first_user = create(:user_with_notes, notes_count: 1)
    @second_user = create(:user_with_notes, notes_count: 1)
    @first_note = @first_user.notes.first
    @second_note = @second_user.notes.first
  end

  test "should redirect create when not logged in or wrong user" do
    post pins_path, params: { id: @first_note.id }
    assert_redirected_to new_user_session_url
    sign_in @second_user
    post pins_path, params: { id: @first_note.id }
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in or wrong user" do
    delete pin_path(@first_note.id)
    assert_redirected_to new_user_session_url
    sign_in @second_user
    delete pin_path(@first_note.id)
    assert_redirected_to root_url
  end

end
