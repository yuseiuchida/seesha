class BookmarksController < ApplicationController
	before_action :set_combination
	def create
		current_user.bookmark(@combination)
	end

	def destroy
		current_user.unbookmark(@combination)
	end

	private

	def set_combination
		@combination = Combination.find(params[:combination_id])
	end
end
