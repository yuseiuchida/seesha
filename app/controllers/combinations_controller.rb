class CombinationsController < ApplicationController
	before_action :set_flavors, only: %i[new create]

	def index
		@combinations = Combination.all
		@compabilities = Compability.all
	end

	def new
		@combination = Combination.new
	end

	def create
		@combination = Combination.new(combination_params)
		if @combination.save
			@combination.setup
			redirect_to combination_path(@combination)
		else
			render :new
		end
	end

	def show
		@combination = Combination.find(params[:id])
		@compabilities = Compability.where(main_combination_id: @combination.id)
		@review = ReviewCombination.where(combination_id: @combination.id).where.not(comment: "")
		@review_combination = ReviewCombination.new
	end

	def likes
		@like_combinations = current_user.like_combinations.includes(:user)
	end

	private

	def combination_params
		params.require(:combination).permit(:first_flavor_id, :second_flavor_id, :sweet_score, :refresh_score, :relax_score, :easy_score, :rating_score)
	end

	def set_flavors
		@flavors = Flavor.all
	end
end
