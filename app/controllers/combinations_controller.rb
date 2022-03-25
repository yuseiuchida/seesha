class CombinationsController < ApplicationController
	def index
		@combinations = Combination.all
	end

	def new
		@combination = Combination.new
		@flavors = Flavor.all
	end

	def create
		@combination = Combination.new(combination_params)
		if @combination.save
			redirect_to combinations_path
		else
			render :new
		end
	end

	private

	def combination_params
		params.require(:combination).permit(:first_flavor, :second_flavor, :third_flavor)
	end
end
