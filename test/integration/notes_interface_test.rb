require 'test_helper'

class NotesInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = create(:user_with_notes, notes_count: 2)
    @first_note = @user.notes.first
  end

  test "notes interface" do

  end

end
