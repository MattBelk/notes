class User < ApplicationRecord
  has_many :notes, dependent: :destroy

  MAX_NAME_LENGTH = 30

  # Include default devise modules, as well as :confirmable.
  # Others available are :lockable, :timeoutable, :trackable and :omniauthable.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }

  
  def pin(note)
    Note.update(note.id, pinned: true)
  end

  def unpin(note)
    Note.update(note.id, pinned: false)
  end

end
