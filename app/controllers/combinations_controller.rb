class CombinationsController < ApplicationController
	before_action :set_flavors, only: %i[new create]

	def index
		@combinations = Combination.all
	end

	def new
		@combination = Combination.new
	end

	def create
		first_flavor_key = combination_params[:first_flavor_id]
		second_flavor_key = combination_params[:second_flavor_id]
		if first_flavor_key <= second_flavor_key
			keyword = Flavor.find(first_flavor_key).name + " " + Flavor.find(second_flavor_key).name
		else
			keyword = Flavor.find(second_flavor_key).name + " " + Flavor.find(first_flavor_key).name
		end

		@combination = Combination.new(first_flavor_id: first_flavor_key, second_flavor_id: second_flavor_key, keyword: keyword)

		if @combination.save
			redirect_to combinations_path
		else
			render :new
		end
	end

	def show
		@combination = Combination.find(params[:id])
		if @combination.review_combinations.exists?
			@combination.set_status
		end
		@compabilities = Compability.where(main_combination_id: @combination.id)
		@review = ReviewCombination.where(combination_id: @combination.id).where.not(comment: "")
		@review_combination = ReviewCombination.new
	end

	def likes
		@like_combinations = current_user.like_combinations.includes(:user)
	end

	private

	def combination_params
		params.require(:combination).permit(:first_flavor_id, :second_flavor_id)
	end

	def set_flavors
		@flavors = Flavor.all
	end
end
