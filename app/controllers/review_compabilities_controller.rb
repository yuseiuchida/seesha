class ReviewCompabilitiesController < ApplicationController
	def create
		@review_compability = current_user.review_compabilities.new(review_compability_params)
		if @review_compability.save
			redirect_to compability_path(params[:compability_id])
		else
			redirect_to compability_path(params[:compability_id])
		end
	end

	private

	def review_compability_params
		params.require(:review_compability).permit(:opinion, :comment).merge(compability_id: params[:compability_id])
	end
end
