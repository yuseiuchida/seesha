class Admin::ShopsController < Admin::BaseController
  before_action :set_category, only: %i[show flavors]
  before_action :set_shop, only: %i[show flavors edit update destroy images]

  def index
    @shops = Shop.all
  end

  def new
    @shop = current_user.shops.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      @shop.geocoding if @shop.address.present?
      redirect_to admin_shop_path(@shop)
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def show
    @flavors = @shop.stock_flavors
  end

  def edit; end

  def update
    if @shop.update(shop_params)
      @shop.geocoding if @shop.address.present?
      redirect_to admin_shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy!
    redirect_to admin_shops_path
  end

  def flavors
    @flavors = Flavor.all
  end

  def images
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :link, :content, :area)
  end

  def set_category
    @categories = Category.all
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
