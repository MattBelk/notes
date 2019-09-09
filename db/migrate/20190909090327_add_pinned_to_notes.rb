class AddPinnedToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :pinned, :boolean
  end
end
