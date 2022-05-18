class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_combinations, through: :bookmarks, source: :combination
  has_many :review_combinations, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true

  enum role: { general: 0, admin: 1 }

  mount_uploader :avatar, AvatarUploader

  def bookmark(combination)
    bookmark_combinations << combination
  end

  def unbookmark(combination)
    bookmark_combinations.delete(combination)
  end

  def bookmark?(combination)
    bookmark_combinations.include?(combination)
  end
end
