class ReviewCompability < ApplicationRecord
	belongs_to :user
	belongs_to :compability

	OPINION = ["", "VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]
end
