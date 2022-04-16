class Admin::FlavorsController < Admin::BaseController
	before_action :set_flavor, only: %i[show edit destroy]
	def index
		@flavors = Flavor.all
	end
	
	def new
		@flavor = Flavor.new
		@categories = Category.all
	end

	def create
		@flavor = Flavor.new(flavor_params)
		if @flavor.save
			redirect_to admin_flavors_path
		else
			render :new
		end
	end

	def show
		@combinations = Combination.where(first_flavor_id: @flavor.id).or(Combination.where(second_flavor_id: @flavor.id))
	end

	def edit
		@categories = Category.all
	end

	def update
		@flavor = Flavor.find(params[:id])
		if @flavor.update(flavor_params)
			redirect_to admin_flavor_path(@flavor)
		else
			render :edit
		end
	end

	def destroy
		if @flavor.destroy!
			redirect_to admin_flavors_path
		else
			render :index
		end
	end


	private

	def flavor_params
		params.require(:flavor).permit(:name, :category_id, :flavor_image)
	end

	def set_category
		@categories = Category.all
	end

	def set_flavor
		@flavor = Flavor.find(params[:id])
	end

end
