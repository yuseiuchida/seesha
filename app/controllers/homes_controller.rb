class HomesController < ApplicationController
	def top
		@easy_searchs = Rate.where("opinion > ?" , 3)
		if @easy_searchs.exists?
			ids = []
			@easy_searchs.each do |easy_search|
				ids << easy_search.id
			end
			@easy_search_id = Combination.find(ids.sample)
		end
	end
end
