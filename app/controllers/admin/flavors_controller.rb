class Admin::FlavorsController < Admin::BaseController
	before_action :set_flavor, only: %i[show edit destroy]

	def index
		if params[:sort_key].nil?
      @flavors = Flavor.order(id: :asc)
    else
      @flavors = Flavor.sort(params[:sort_key])
    end
	end
	
	def new
		@flavor = current_user.flavors.new
		@categories = Category.all
	end

	def create
		@flavor = current_user.flavors.new(flavor_params)
		if @flavor.save
			redirect_to admin_flavors_path
		else
			render :new
		end
	end

	def show
		@combinations = Combination.where_flavors(@flavor)
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

  def gathers
    @flavor = Flavor.find(params[:id])
    @hints = Hint.all
  end

	private

	def flavor_params
		params.require(:flavor).permit(:name, :category_id, :flavor_image)
	end

	def set_flavor
		@flavor = Flavor.find(params[:id])
	end

end
