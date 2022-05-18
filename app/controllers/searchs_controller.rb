class SearchsController < ApplicationController
	skip_before_action :require_login
	def index
		@categories = Category.all
	end

	def create
		@search_combination = Rate.recommend(params)
		redirect_to search_path(@search_combination)
	end

  def rate
		rate_ids = Rate.where("rating_rate > ?", 3.5).ids
		@search_combination = Combination.find(Rate.find(rate_ids.sample).combination_id)
		redirect_to search_path(@search_combination)
	end

	def show
		@combination = Combination.find(params[:id])
		easy_searchs = Combination.all
		
		ids = []
		easy_searchs.each do |easy_search|
			ids << easy_search.id
		end
		@search_combination = Combination.find(ids.sample)
	end
end