class HomesController < ApplicationController
	def top
		easy_searchs = Rate.where("rating_rate > ?" , 4)
		if easy_searchs.exists?
			ids = []
			easy_searchs.each do |easy_search|
				ids << easy_search.id
			end
			return @easy_search_id = Combination.find(ids.sample)
		else
			@easy_search_id = Combination.first
		end
	end
end
