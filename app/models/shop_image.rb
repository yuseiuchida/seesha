class ShopImage < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  mount_uploader :image, ShopImageUploader

  validates :image, presence: true
end
