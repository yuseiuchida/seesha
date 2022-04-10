class PosterStatus < ApplicationRecord
	belongs_to :combination

	def setup_score
		if self.opinion == "strong"
			Status.create(combination_id: self.combination_id, score: 80)
		elsif self.opinion == "positive"
			Status.create(combination_id: self.combination_id, score: 60)
		elsif self.opinion == "neutral"
			Status.create(combination_id: self.combination_id, score: 40)
		else
			Status.create(combination_id: self.combination_id, score: 0)
		end
	end
end
