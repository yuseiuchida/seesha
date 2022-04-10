class Combination < ApplicationRecord
	belongs_to :first_flavor, class_name: "Flavor"
	belongs_to :second_flavor, class_name: "Flavor"
	has_many :likes, dependent: :destroy
	has_many :compabilities, class_name: "Compability", foreign_key: "main_combination_id"
	has_many :compabilities, class_name: "Compability", foreign_key: "sub_combination_id"
	has_many :review_combinations, dependent: :destroy
	has_one :status, dependent: :destroy
	has_one :poster_status, dependent: :destroy

	validates :title, uniqueness: true

	OPINION = ["VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]
end
