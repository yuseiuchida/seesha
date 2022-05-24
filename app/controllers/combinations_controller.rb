class CombinationsController < ApplicationController
  before_action :set_categories, only: %i[new create]
  before_action :set_q, only: %i[index finds]
  skip_before_action :require_login, only: %i[index show finds]

  def index
    if params[:sort_key].nil?
      @rates = Rate.all.order(updated_at: :desc)
    else
      @rates = Rate.sort(params[:sort_key])
    end
  end

  def new
    @combination = Combination.new
    @first_category = Category.find(params[:first_category]) if params[:first_category].present?
    @second_category = Category.find(params[:second_category]) if params[:second_category].present?
    @third_category = Category.find(params[:third_category]) if params[:third_category].present?
    @fourth_category = Category.find(params[:fourth_category]) if params[:fourth_category].present?
    if @fourth_category.present?
      @total_flavors = 4
    elsif @third_category.present?
      @total_flavors = 3
    else
      @total_flavors = 2
    end
  end

  def create
    @combination = Combination.new(combination_params)
    if @combination.save
      @combination.setup if @combination.rating_score.present?
      redirect_to combination_path(@combination), success: "コンビネーション「#{@combination.name}」が追加されました"
    else
      flash.now[:danger] = '入力に誤りがあるか、既に登録されたフレーバーです'
      render :new
    end
  end

  def show
    @combination = Combination.find(params[:id])
    @review = ReviewCombination.where(combination_id: @combination.id).where.not(comment: "")
    @review_combination = ReviewCombination.new
  end

  def likes
    @like_combinations = current_user.like_combinations.includes(:user)
  end

  def finds
    @results = @q.result
  end

  private

  def combination_params
    params.require(:combination).permit(:first_flavor_id, :second_flavor_id, :third_flavor_id, :fourth_flavor_id, :total_flavors, :sweet_score, :refresh_score, :relax_score, :easy_score, :rating_score)
  end

  def set_categories
    @categories = Category.all.order(id: :asc)
  end

  def set_q
    @q = Combination.ransack(params[:q])
  end
end
