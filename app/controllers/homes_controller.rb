class HomesController < ApplicationController
	def top
		@easy_searchs = Combination.where(status: Combination::STATUS[0]).or(Combination.where(status: Combination::STATUS[1]))
		if @easy_searchs.exists?
			ids = []
			easy_searchs.each do |easy_search|
				ids << easy_search.id
			end
			@easy_search_id = Combination.find(ids.sample)
		end
	end
end
