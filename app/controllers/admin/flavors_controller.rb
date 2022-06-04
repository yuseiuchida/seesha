class Admin::FlavorsController < Admin::BaseController
  before_action :set_flavor, only: %i[show edit destroy]
  before_action :set_categories, only: %i[new create edit update]

  def index
    @flavors = if params[:sort_key].nil?
                 Flavor.order(id: :asc)
               else
                 Flavor.sort(params[:sort_key])
               end
  end

  def new
    @flavor = current_user.flavors.new
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

  def set_categories
    @categories = Category.all
  end
end
