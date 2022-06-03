class Stock < ApplicationRecord
  belongs_to :shop
  belongs_to :flavor

  validates :shop_id, uniqueness: { scope: :flavor_id }

  enum status: { unfixed: 0, fixed: 1 }
end
