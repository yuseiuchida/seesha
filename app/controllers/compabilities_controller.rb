class CompabilitiesController < ApplicationController
	before_action :set_combinations, only: %i[new create]
	def new
		@compability = Compability.new
	end

	def create
		@compability = Compability.new(main_combination_id: params[:combination_id], sub_combination_id: compability_params[:sub_combination_id], kind: compability_params[:kind])
		if @compability.save
			redirect_to combination_path(params[:combination_id])
		else
			render :new
		end
	end

	private

	def compability_params
		params.require(:compability).permit(:sub_combination_id, :kind)
	end

	def set_combinations
		@main_combination = Combination.find(params[:combination_id])
		@combinations = Combination.all
	end
end
