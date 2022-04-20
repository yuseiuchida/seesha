class SearchsController < ApplicationController
	skip_before_action :require_login
	def index
		@categories = Category.all
	end

	def create
		@search_combination = Rate.recommend(params)
		redirect_to search_path(@search_combination)
	end



	def show
		@combination = Combination.find(params[:id])
		@compabilities = Compability.where(main_combination_id: @combination.id).limit(2)
		easy_searchs = Combination.all
		
		ids = []
		easy_searchs.each do |easy_search|
			ids << easy_search.id
		end
		@search_combination = Combination.find(ids.sample)
	end
end
