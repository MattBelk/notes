class User < ApplicationRecord

  MAX_NAME_LENGTH = 20

  # Include default devise modules, as well as :confirmable.
  # Others available are :lockable, :timeoutable, :trackable and :omniauthable.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: {maximum: MAX_NAME_LENGTH}

end
