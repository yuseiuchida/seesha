class ReviewCombination < ApplicationRecord
	belongs_to :user
	belongs_to :combination

	OPINION = ["VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]
	SWEET = ["", "甘い", "甘くない"]
	REFRESH = ["", "スッキリする", "スッキリしない"]
	RELAX = ["", "リラックスする", "リラックスしない"]
	EASY = ["", "吸いやすい", "個性的"]

	def setup_score
		status = Status.find_by(combination_id: self.combination_id)
		sweet = ((self.where(sweet: ReviewCombination::SWEET[1]).count.to_f / self.where.not(sweet: ReviewCombination::SWEET[0]).count.to_f).round(3)) * 100
		refresh = ((self.where(sweet: ReviewCombination::REFRESH[1]).count.to_f / self.where.not(sweet: ReviewCombination::REFRESH[0]).count.to_f).round(3)) * 100
		relax = ((self.where(sweet: ReviewCombination::RELAX[1]).count.to_f / self.where.not(sweet: ReviewCombination::RELAX[0]).count.to_f).round(3)) * 100
		easy = ((self.where(sweet: ReviewCombination::EASY[1]).count.to_f / self.where.not(sweet: ReviewCombination::EASY[0]).count.to_f).round(3)) * 100

		if self.opinion == ReviewCombination::OPINION[0]
			status.update(sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy, opinion: status.opinion + 5)
		elsif self.opinion == ReviewCombination::OPINION[1]
			status.update(sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy, opinion: status.opinion + 2)
		elsif self.opinion == ReviewCombination::OPINION[2]
			status.update(sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy, opinion: status.opinion + 0)
		elsif self.opinion == ReviewCombination::OPINION[3]
			status.update(sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy, opinion: status.opinion - 2)
		else
			status.update(sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy, opinion: status.opinion - 5)
		end
	end
end
