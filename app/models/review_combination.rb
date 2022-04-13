class ReviewCombination < ApplicationRecord
	belongs_to :user
	belongs_to :combination

	OPINION = ["VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]
	SWEET = ["", "甘い", "甘くない"]
	REFRESH = ["", "スッキリする", "スッキリしない"]
	RELAX = ["", "リラックスする", "リラックスしない"]
	EASY = ["", "吸いやすい", "個性的"]

	def setup_score
		poster = Poster.find_by(combination_id: self.combination_id)
		review = ReviewCombination.where(combination_id: self.combination_id)
		coefficient = Coefficient.find_by(combination_id: self.combination_id)

		a = review.where(sweet: ReviewCombination::SWEET[1]).count + poster.sweet
		b = review.where.not(sweet: ReviewCombination::SWEET[0]).count + 1
		sweet = (a.to_f/b.to_f).round(3) * coefficient.sweet

		a = review.where(refresh: ReviewCombination::REFRESH[1]).count + poster.refresh
		b = review.where.not(refresh: ReviewCombination::REFRESH[0]).count + 1
		refresh = (a.to_f/b.to_f).round(3) * coefficient.refresh

		a = review.where(relax: ReviewCombination::RELAX[1]).count + poster.relax
		b = review.where.not(relax: ReviewCombination::RELAX[0]).count + 1
		relax = (a.to_f/b.to_f).round(3) * coefficient.relax

		a = review.where(easy: ReviewCombination::EASY[1]).count + poster.easy
		b = review.where.not(easy: ReviewCombination::EASY[0]).count + 1
		easy = (a.to_f/b.to_f).round(3) * coefficient.easy

		a = review.where(opinion: ReviewCombination::OPINION[0]).count * 5
		b = review.where(opinion: ReviewCombination::OPINION[1]).count * 4
		c = review.where(opinion: ReviewCombination::OPINION[2]).count * 3
		d = review.where(opinion: ReviewCombination::OPINION[3]).count * 2
		e = review.where(opinion: ReviewCombination::OPINION[4]).count * 1
		f = ReviewCombination.all.count + 1
		score = a + b + c + d + e + poster.opinion
		opinion = (score / f) * coefficient.opinion
		opinion_status = Rate::STATUS[opinion.round]


		Rate.find_by(combination_id: self.combination_id).update(sweet: sweet, refresh: refresh, relax: relax, easy: easy, opinion: opinion, opinion_status: opinion_status)
	end
end
