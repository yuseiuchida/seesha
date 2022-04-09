class ReviewCombinationsController < ApplicationController

	def create
		@review_combination = current_user.review_combinations.new(review_combination_params)
		if @review_combination.save
			@review_combination.set_rate_for_combination
			@review_combination.set_score_for_combination
			redirect_to combination_path(params[:combination_id])
		else
			redirect_to combination_path(params[:combination_id])
		end
	end

	def destroy
	end

	private

	def review_combination_params
		params.require(:review_combination).permit(:opinion, :sweet, :refresh, :easy, :comment).merge(combination_id: params[:combination_id])
	end
end
