class Category < ApplicationRecord
  has_many :flavors
  validates :name, uniqueness: true
end
