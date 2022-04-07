class Flavor < ApplicationRecord
	has_many :combinations, class_name: "Combination", foreign_key: "first_flavor_id"
	has_many :combinations, class_name: "Combination", foreign_key: "second_flavor_id"
	belongs_to :category

	validates :name, presence: true
	validates :name, uniqueness: true
end
