class Combination < ApplicationRecord
	belongs_to :first_flavor, class_name: "Flavor"
	belongs_to :second_flavor, class_name: "Flavor"
	has_many :likes	
	has_many :compabilities, class_name: "Compability", foreign_key: "main_combination_id"
	has_many :compabilities, class_name: "Compability", foreign_key: "sub_combination_id"
	has_many :review_combinations

	validates :keyword, uniqueness: true
end
