class Rate < ApplicationRecord
	belongs_to :combination

	validates :sweet, :refresh, :relax, :easy, :opinion, presence: true

	NUMBER = [0.8, 0.9, 1.0, 1.1, 1.2]
	STATUS = ["BAD", "NOT GOOD", "NOT BAD", "GOOD", "VERY GOOD", "VERY GOOD", "EXCELLENT"]

	def set_opinion_status
		opinion = self.opinion
		self.update(opinion_status: Rate::STATUS[opinion.round])
	end
end
