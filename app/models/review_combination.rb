class ReviewCombination < ApplicationRecord
	belongs_to :user
	belongs_to :combination

	OPINION = ["", "VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]
	SWEET = ["", "甘い", "甘くない"]
	REFRESH = ["", "スッキリする", "スッキリしない"]
	EASY = ["", "吸いやすい", "個性的"]

	def set_rate_for_combination
		sweet_rate = (( ReviewCombination.where(sweet: "甘い", combination_id: self.combination.id).count.to_f / ReviewCombination.all.count.to_f ).round(3) * 100).to_i
		Combination.find(self.combination.id).update(sweet_rate: sweet_rate)

		refresh_rate = (( ReviewCombination.where(refresh: "スッキリする", combination_id: self.combination.id).count.to_f / ReviewCombination.all.count.to_f ).round(3) * 100).to_i
		Combination.find(self.combination.id).update(refresh_rate: refresh_rate)

		easy_rate = (( ReviewCombination.where(easy: "吸いやすい", combination_id: self.combination.id).count.to_f / ReviewCombination.all.count.to_f ).round(3) * 100).to_i
		Combination.find(self.combination.id).update(easy_rate: easy_rate)
	end

	def set_score_for_combination
		reviews = ReviewCombination.where(combination_id: self.combination.id)
		positive2 = reviews.where(opinion: "VERY GOOD").count * 2
		positive1 = reviews.where(opinion: "GOOD").count * 1
		negative1 = reviews.where(opinion: "NOT GOOD").count * -1
		negative2 = reviews.where(opinion: "BAD").count * -2
		total_score = positive2 + positive1 + negative1 + negative2
		Combination.find(self.combination.id).update(score: total_score)
	end
end
