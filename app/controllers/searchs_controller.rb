class SearchsController < ApplicationController
  skip_before_action :require_login
  def index
    @categories = Category.all
  end

  def create
    combinations = Rate.recommend(search_params)
    if combinations.present?
      combination = combinations.where('name like ?', "%#{search_params[:keyword]}%").shuffle.push[0]
      redirect_to search_path(id: combination.id, name: combination.name)
    else
      redirect_to sorry_path
    end
  end

  def show
    @combination = Combination.find(params[:id])
  end

  private

  def search_params
    params.permit(:easy, :sweet, :feeling, :what, :keyword)
  end
end