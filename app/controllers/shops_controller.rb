class ShopsController < ApplicationController
  skip_before_action :require_login, only: %i[index show gacha gachagacha pon]
  before_action :set_category, only: %i[show flavors]
  before_action :set_shop, only: %i[show flavors edit update gacha gachagacha pon lock]

  def index
    @shops = Shop.order(area: :desc)
    gon.shops = Shop.order(area: :desc)
  end

  def new
    @shop = current_user.shops.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      @shop.geocoding if @shop.address.present?
      redirect_to shop_path(@shop)
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
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def flavors
    @flavors = Flavor.all
  end

  def pon
    @flavors = @shop.stock_flavors.where(id: params[:ids]).order(category_id: :asc)
    name = @flavors.map(&:name).join(' ')
    @combination = Combination.find_by(name: name)
    @hints = Flavor.find_hints(@flavors)
  end

  def gacha

  end

  def gachagacha
    ids = @shop.stock_flavors.gacha(params[:kind])
    redirect_to pon_shop_path(ids: ids, id: @shop.id)
  end

  def lock
    @shop.stocks.update(status: 1)
    redirect_to shop_path(@shop)
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
