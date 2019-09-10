require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase

  def setup
    @user = create(:user_with_notes, notes_count: 2)
    @first_note = @user.notes.first
  end

  test "notes actions" do
    sign_in @user
    visit root_path
    assert_selector('div.grid#pinned')
    assert_selector('div.grid#unpinned')
    assert_selector('.grid-item', count: 2)
    assert_selector('h1', text: "2 unpinned notes", count: 1)

    # Make new note
    fill_in('Title', with: "title")
    assert_difference 'Note.count', 1 do
      click_button('Add note')
      assert_selector('#unpinned .grid-item', count: 3)
      assert_selector('h1', text: '3 unpinned notes', count: 1)
      assert_selector('div.alert-success ul li', text: 'Note Created')
    end

    # Delete note
    assert_difference 'Note.count', -1 do
      accept_confirm "Are you sure?" do
        click_link('Delete note', match: :first)
      end
      assert_selector('#unpinned .grid-item', count: 2)
      assert_selector('h1', text: '2 unpinned notes', count: 1)
      assert_selector('div.alert-danger ul li', text: 'Note Deleted')
    end

    # Edit note
    click_link('Edit note', match: :first)
    within('#edit-modal') do
      fill_in('Title', with: "a very specific title")
      click_button('Save changes')
    end
    assert_selector('#unpinned .grid-item', count: 2)
    assert_selector('.card-header', text: "a very specific title", count: 1)
    assert_selector('h1', text: '2 unpinned notes', count: 1)
    assert_selector('div.alert-success ul li', text: 'Note Updated')

    # Pin and unpin note
    assert_difference 'Note.pinned.count', 1 do
      assert_difference 'Note.unpinned.count', -1 do
        page.find('.pin-btn', match: :first).click
        assert_selector('h1', text: '1 unpinned note', count: 1)
        assert_selector('h1', text: '1 pinned note', count: 1)
        assert_selector('#unpinned .grid-item', count: 1)
        assert_selector('#pinned .grid-item', count: 1)
      end
    end
  end

end
