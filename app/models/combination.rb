class Combination < ApplicationRecord
	belongs_to :first_flavor, class_name: "Flavor"
	belongs_to :second_flavor, class_name: "Flavor"
	has_many :likes	
	has_many :compabilities, class_name: "Compability", foreign_key: "main_combination_id"
	has_many :compabilities, class_name: "Compability", foreign_key: "sub_combination_id"
	has_many :review_combinations

	validates :keyword, uniqueness: true

	STATUS = ["VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD"]

	def set_status
		if self.score > 5
			self.update(status: Combination::STATUS[0])
		elsif self.score >= 1
			self.update(status: Combination::STATUS[1])
		elsif self.score < -2
			self.update(status: Combination::STATUS[2])
		else
			self.update(status: Combination::STATUS[3])
		end
	end
end
