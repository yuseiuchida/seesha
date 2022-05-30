class FlavorsController < ApplicationController
	before_action :set_category
	skip_before_action :require_login
	def index
		@flavors = Flavor.all
		@categories = Category.all
		@combinations = Combination.all
	end

	def show
		@flavor = Flavor.find(params[:id])
		@combinations = Combination.where(first_flavor_id: @flavor.id).or(Combination.where(second_flavor_id: @flavor.id)).or(Combination.where(third_flavor_id: @flavor.id)).or(Combination.where(fourth_flavor_id: @flavor.id))
	end

	private

	def flavor_params
		params.require(:flavor).permit(:name, :category_id, :flavor_image)
	end

	def set_category
		@categories = Category.all
	end

end
