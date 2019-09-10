require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @first_user = create(:user_with_notes, notes_count: 1)
    @second_user = create(:user_with_notes, notes_count: 1)
    @first_note = @first_user.notes.first
    @second_note = @second_user.notes.first
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Note.count" do
      post user_notes_path, params: { note: { title: "title" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in or wrong user" do
    assert_no_difference "Note.count" do
      delete user_note_path(@first_note)
    end
    assert_redirected_to new_user_session_url
    sign_in @second_user
    assert_no_difference "Note.count" do
      delete user_note_path(@first_note)
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when note logged in or wrong user" do
    get edit_user_note_path(@first_note)
    assert_redirected_to new_user_session_url
    sign_in @second_user
    get edit_user_note_path(@first_note)
    assert_redirected_to root_url
  end

  test "should redirect update when note logged in or wrong user" do
    patch user_note_path(@first_note), params: { note: { title: "title" } }
    assert_not_equal "title", @first_note.title
    sign_in @second_user
    patch user_note_path(@first_note), params: { note: { title: "title" } }
    assert_not_equal "title", @first_note.title
    assert_redirected_to root_url
  end

end
