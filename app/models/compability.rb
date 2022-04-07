class Compability < ApplicationRecord
	belongs_to :main_combination, class_name: "Combination"
	belongs_to :sub_combination, class_name: "Combination"
	has_many :review_compabilities

	validates :main_combination_id, uniqueness: { scope: :sub_combination_id }

	KIND = ["似たフレーバーを楽しむ", "違うフレーバーを楽しむ"]
end
