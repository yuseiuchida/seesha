class StocksController < ApplicationController
  before_action :set_shop
  before_action :set_flavor

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

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_flavor
    @flavor = Flavor.find(params[:flavor_id])
  end
end
