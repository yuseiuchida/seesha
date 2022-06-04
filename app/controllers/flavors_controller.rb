class FlavorsController < ApplicationController
  before_action :set_category
  skip_before_action :require_login

  def index
    @flavors = Flavor.all
    @categories = Category.all
    @combinations = Combination.all
  end

  def show
    @flavor = Flavor.find(params[:id])
    @combinations = Combination.where_flavors(@flavor)
  end

  def new
    @flavor = current_user.flavors.new
  end

  def create
    @flavor = current_user.flavors.new(flavor_params)
    if @flavor.save
      redirect_to flavors_path, success: "#{@flavor.name}を登録しました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def destroy
    @flavor = Flavor.find(params[:id])
    @flavor.destroy!
    redirect_to flavors_path, success: "フレーバーを削除しました"
  end

  private

  def flavor_params
    params.require(:flavor).permit(:name, :category_id, :flavor_image)
  end

  def set_category
    @categories = Category.all
  end
end
