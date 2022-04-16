class ReviewCombination < ApplicationRecord
	belongs_to :user
	belongs_to :combination

	SWEET = ["", "甘い", "甘くない"]
	REFRESH = ["", "スッキリする", "スッキリしない"]
	RELAX = ["", "リラックスする", "リラックスしない"]
	EASY = ["", "吸いやすい", "個性的"]
	RATING = ["VERY GOOD", "GOOD", "NOT BAD", "NOT GOOD", "BAD"]

end

