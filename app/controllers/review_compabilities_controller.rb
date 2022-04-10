class ReviewCompabilitiesController < ApplicationController
	def create
		@review_compability = current_user.review_compabilities.new(review_compability_params)
		if @review_compability.save
			@review_compability.set_score_for_compability
			redirect_to compability_path(params[:compability_id])
		else
			redirect_to compability_path(params[:compability_id])
		end
	end

	def destroy
		review_compability = ReviewCompability.find(params[:compability_id])
		review_compability.update(comment: "")
		redirect_to compability_path(params[:id])
	end

	private

	def review_compability_params
		params.require(:review_compability).permit(:opinion, :comment).merge(compability_id: params[:compability_id])
	end
end
