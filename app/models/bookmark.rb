class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :combination

  validates :user_id, uniqueness: { scope: :combination_id }
end
