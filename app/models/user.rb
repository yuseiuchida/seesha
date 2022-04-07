class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :likes
  has_many :like_combinations, through: :likes, source: :combination
  has_many :review_combinations
  has_many :review_compabilities

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true

  def like(combination)
    like_combinations << combination
  end

  def unlike(combination)
    like_combinations.delete(combination)
  end

  def like?(combination)
    like_combinations.include?(combination)
  end
end
