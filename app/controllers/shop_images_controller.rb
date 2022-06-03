class ShopImagesController < ApplicationController
  before_action :set_shop
  def new
    @shop_image = @shop.shop_images.new
  end

  def create
    @shop_image = @shop.shop_images.new(shop_image_params)
    if @shop_image.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def destroy
    @shop_image = @shop.shop_images.find(params[:id])
    @shop_image.destroy
    redirect_to shop_path(@shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def shop_image_params
    params.fetch(:shop_image, {}).permit(:image).merge(user_id: current_user.id)
  end
end
