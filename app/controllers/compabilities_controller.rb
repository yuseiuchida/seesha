class CompabilitiesController < ApplicationController
	before_action :set_combinations, only: %i[new create]

	def index
		@compabilities = Compability.all
	end

	def new
		@compability = Compability.new
	end

	def show
		@compability = Compability.find(params[:id])
		if @compability.review_compabilities.exists?
			@compability.set_status
		end
		@review = ReviewCompability.where(compability_id: @compability.id).where.not(comment: "")
		@review_compsbility = ReviewCompability.new
	end

	def create
		@compability = Compability.new(compability_params)
		if @compability.save
			redirect_to combinations_path
		else
			render :new
		end
	end

	private

	def compability_params
		params.require(:compability).permit(:main_combination_id, :sub_combination_id, :kind)
	end

	def set_combinations
		@main_combination = Combination.all
		@combinations = Combination.all
	end
end
