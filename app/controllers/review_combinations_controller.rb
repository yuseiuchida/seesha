class ReviewCombinationsController < ApplicationController
	def create
		@review_combination = current_user.review_combinations.new(review_combination_params)
		if @review_combination.save
			@review_combination.setup_score
			redirect_to combination_path(params[:combination_id])
		else
			redirect_to combination_path(params[:combination_id])
		end
	end

	def destroy
		review_combination = ReviewCombination.find(params[:combination_id])
		review_combination.update(comment: "")
		redirect_to combination_path(params[:id])
	end

	private

	def review_combination_params
		params.require(:review_combination).permit(:opinion, :sweet, :refresh, :relax, :easy, :comment).merge(combination_id: params[:combination_id])
	end
end
