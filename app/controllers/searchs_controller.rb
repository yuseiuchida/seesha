class SearchsController < ApplicationController
	skip_before_action :require_login
	def index
		@categories = Category.all
	end

	def create
		@search_combination = Rate.recommend(params)
		if @search_combination.present?
			redirect_to search_path(@search_combination)
		else
			redirect_to sorry_path
		end
	end

  def rate
		rate_ids = Rate.where("rating_rate > ?", 3.5).ids
		@search_combination = Combination.find(Rate.find(rate_ids.sample).combination_id)
		redirect_to search_path(@search_combination)
	end

	def show
		@combination = Combination.find(params[:id])
	end
end