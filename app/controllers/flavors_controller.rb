class FlavorsController < ApplicationController
	before_action :set_category
	def index
		@flavors = Flavor.all
	end

	def new
		@flavor = Flavor.new
	end

	def create
		@flavor = Flavor.new(flavor_params)
		if @flavor.save
			redirect_to flavors_path
		else
			render :new
		end
	end

	private

	def flavor_params
		params.require(:flavor).permit(:name, :category_id, :image)
	end

	def set_category
		@categories = Category.all
	end

end
