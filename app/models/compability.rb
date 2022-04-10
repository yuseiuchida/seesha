class Compability < ApplicationRecord
	belongs_to :main_combination, class_name: "Combination"
	belongs_to :sub_combination, class_name: "Combination"
	has_many :review_compabilities

	validates :main_combination_id, uniqueness: { scope: :sub_combination_id }

	KIND = ["似たフレーバーを楽しむ", "違うフレーバーを楽しむ"]

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
