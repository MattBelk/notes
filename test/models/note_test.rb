require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  
  def setup
    @user = create(:user_with_notes, notes_count: 10)
  end

  test "order should be by position" do
    # Note: The first? and last? methods are from acts_as_list gem,
    #       which is used to implement the position of notes.
    assert @user.notes.first.first?
    assert @user.notes.last.last?
  end

end
