class Admin::CoefficientsController < ApplicationController
	def edit
		@rate = Coefficient.find(params[:id])
	end

	def update
		@rate = Coefficient.find(params[:id])
		if @rate.update(rate_params)
			redirect_to admin_combination_path(id: @rate.combination_id)
		else
			render :edit
		end
	end

	private

	def rate_params
		params.require(:rate).permit(:opinion, :sweet, :refresh, :relax, :easy)
	end
end
