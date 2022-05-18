module FlavorsHelper
	def find_combinations(flavor)
		@combination = Combination.where(first_flavor_id: flavor.id).or(Combination.where(second_flavor_id: flavor.id)).or(Combination.where(third_flavor_id: flavor.id)).or(Combination.where(fourth_flavor_id: flavor.id))
	end
end
