class ReviewCompability < ApplicationRecord
	belongs_to :user
	belongs_to :compability

	OPINION = ["", "VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]

	def set_score_for_compability
		reviews = ReviewCompability.where(compability_id: self.compability.id)
		positive2 = reviews.where(opinion: "VERY GOOD").count * 2
		positive1 = reviews.where(opinion: "GOOD").count * 1
		negative1 = reviews.where(opinion: "NOT GOOD").count * -1
		negative2 = reviews.where(opinion: "BAD").count * -2
		total_score = positive2 + positive1 + negative1 + negative2
		Compability.find(self.compability.id).update(score: total_score)
	end
end
