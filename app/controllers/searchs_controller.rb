class SearchsController < ApplicationController
	def index
		@categories = Category.all
	end

	def create
		combination = Combination.find(params[:sweet])
		redirect_to search_path(combination)
	end

	def show
		@combination = Combination.find(params[:id])
		@compabilities = Compability.where(main_combination_id: @combination.id).limit(2)
		easy_searchs = Combination.all
		ids = []
		easy_searchs.each do |easy_search|
			ids << easy_search.id
		end
		@easy_search_id = Combination.find(ids.sample)
	end

	private

end
