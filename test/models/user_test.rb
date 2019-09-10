require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = create(:user_with_notes, notes_count: 1)
    @note = @user.notes.first
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a"*31
    assert_not @user.valid?
  end

  test "associated notes should be destroyed" do
    assert_difference "Note.count", -1 do
      @user.destroy
    end
  end

  test "should pin and unpin a note" do
    assert_equal false, @note.pinned
    @user.pin(@note)
    @note.reload
    assert_equal true, @note.pinned
    @user.unpin(@note)
    @note.reload
    assert_equal false, @note.pinned
  end

end
