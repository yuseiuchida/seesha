class Admin::ShopImagesController < Admin::BaseController
  before_action :set_shop
  def create
    @shop_image = @shop.shop_images.new(shop_image_params)
    if @shop_image.save
      redirect_to images_admin_shop_path(@shop), success: '画像が追加されました'
    else
      redirect_to images_admin_shop_path(@shop), danger: '画像の追加に失敗しました'
    end
  end

  def destroy
    @shop_image = @shop.shop_images.find(params[:id])
    @shop_image.destroy
    redirect_to images_admin_shop_path(@shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def shop_image_params
    params.fetch(:shop_image, {}).permit(:image).merge(user_id: current_user.id)
  end
end
