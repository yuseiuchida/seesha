class Admin::FlavorsController < Admin::BaseController
	def index
		@flavors = Flavor.all
		@flavor = Flavor.new
		@categories = Category.all
	end

	def create
		@flavor = Flavor.new(flavor_params)
		if @flavor.save
			redirect_to flavors_path
		else
			render :new
		end
	end

	def show
		@flavor = Flavor.find(params[:id])
		@combinations = Combination.where(first_flavor_id: @flavor.id).or(Combination.where(second_flavor_id: @flavor.id))
	end

	def edit
		@flavor = Flavor.find(params[:id])
		@categories = Category.all
	end

	def update
		@flaovr = Flavor.find(params[:id])
		if @flaovr.update(flavor_params)
			redirect_to admin_flavors_path
		else
			render :edit
		end
	end

	def destroy
		@flavor = Flavor.find(params[:id])
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

end
