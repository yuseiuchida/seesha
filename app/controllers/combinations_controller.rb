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
		title = Flavor.find(combination_params[:first_flavor_id]).name + " " + Flavor.find(combination_params[:second_flavor_id]).name

		@combination = Combination.new(first_flavor_id: combination_params[:first_flavor_id], second_flavor_id: combination_params[:second_flavor_id], title: title)
		if @combination.save
			@rate = Rate.create(combination_id: @combination.id, sweet: combination_params[:sweet], refresh: combination_params[:refresh], relax: combination_params[:relax], easy: combination_params[:easy], opinion: combination_params[:opinion])
			@rate.set_opinion_status
			@poster = Poster.create(combination_id: @combination.id, sweet: combination_params[:sweet], refresh: combination_params[:refresh], relax: combination_params[:relax], easy: combination_params[:easy], opinion: combination_params[:opinion])
			Coefficient.create(combination_id: @combination.id)
			redirect_to combinations_path
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
		params.require(:combination).permit(:first_flavor_id, :second_flavor_id, :title, :sweet, :refresh, :relax, :easy, :opinion)
	end

	def set_flavors
		@flavors = Flavor.all
	end
end
