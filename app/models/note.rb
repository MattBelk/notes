class Note < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user
  has_rich_text :body
  default_scope { order(position: :asc) }

  def self.pinned
    where(pinned: true)
  end

  def self.unpinned
    where(pinned: nil).or(where(pinned: false))
  end

  def pin
    update_attributes(pinned: true)
  end

  def unpin
    update_attributes(pinned: false)
  end

end
