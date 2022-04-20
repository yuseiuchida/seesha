class ReviewCombinationsController < ApplicationController
	def create
		@review_combination = current_user.review_combinations.new(review_combination_params)
		if @review_combination.save
			Combination.find(@review_combination.combination_id).set_rate
			redirect_to combination_path(params[:combination_id]), success: 'レビューを投稿しました'
		else
			redirect_to combination_path(params[:combination_id]), danger: '入力に誤りがあるため投稿できませんでした'
		end
	end

	def destroy
		review_combination = ReviewCombination.find(params[:combination_id])
		review_combination.update(comment: "")
		redirect_to combination_path(params[:id])
	end

	private

	def review_combination_params
		params.require(:review_combination).permit(:rating, :sweet, :refresh, :relax, :easy, :comment).merge(combination_id: params[:combination_id])
	end
end
