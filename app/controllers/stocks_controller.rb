class StocksController < ApplicationController
  before_action :set_shop
  before_action :set_flavor, except: %i[stock_all stock_empty]

  def create
    @shop.stock(@flavor)
  end

  def destroy
    @shop.unstock(@flavor)
  end

  def fixed
    @shop.fixed(@flavor)
  end

  def unfixed
    @shop.unfixed(@flavor)
  end

  def stock_all
    @shop.stock_all
    redirect_to flavors_shop_path(@shop)
  end

  def stock_empty
    @shop.stock_empty
    redirect_to flavors_shop_path(@shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_flavor
    @flavor = Flavor.find(params[:flavor_id])
  end
end
