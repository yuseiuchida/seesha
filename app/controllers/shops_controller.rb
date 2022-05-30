class ShopsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_category, only: %i[show flavors]
  before_action :set_shop, only: %i[show flavors]

  def index
    @shops = Shop.all
    gon.shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      @shop.geocoding if @shop.address.present?
      redirect_to shop_path(@shop)
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @flavors = @shop.stock_flavors
  end

  def flavors
    @flavors = Flavor.all
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :access, :operating, :closed, :link, :content, :area)
  end

  def set_category
    @categories = Category.all
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
