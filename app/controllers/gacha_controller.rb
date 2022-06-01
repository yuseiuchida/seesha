class GachaController < ApplicationController
  skip_before_action :require_login, only: %i[new index create]
  def new
    @flavors = Flavor.where(id: params[:ids]).order(category_id: :asc)
    name = @flavors.map(&:name).join(" ")
    @combination = Combination.find_by(name: name)
    @hints = Flavor.find_hints(@flavors)
  end

  def index; end


  def create
    ids = Flavor.gacha(params[:kind])
    redirect_to new_gacha_path(ids: ids)
  end
end
