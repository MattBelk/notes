class AddPinnedToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :pinned, :boolean, null: false, default: false
  end
end
