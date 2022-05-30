class Hint < ApplicationRecord
  has_many :gathers, dependent: :destroy

  validates :content, presence: true, uniqueness: true
end
