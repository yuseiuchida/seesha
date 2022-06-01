class Admin::CombinationsController < Admin::BaseController
  before_action :set_categories, only: %i[new create]
  before_action :set_combination, only: %i[show edit update destroy]

  def index
    @combinations = Combination.order(id: :desc)
  end

  def new
    @combination = current_user.combinations.new
  end

  def create
    exchange_params = Combination.exchange(combination_params, params)
    @combination = current_user.combinations.new(exchange_params)
    if @combination.save
      @combination.setup
      redirect_to admin_combination_path(@combination)
    else
      render :new
    end
  end

  def show
    @review = ReviewCombination.where(combination_id: @combination.id).where.not(comment: '')
    @review_combination = ReviewCombination.new
  end

  def likes
    @like_combinations = current_user.like_combinations.includes(:user)
  end

  def edit
    @flavors = Flavor.all
  end

  def update
    if @combination.update(combination_params)
      @combination.set_rate
      redirect_to admin_combination_path(@combination)
    else
      render :edit
    end
  end

  def destroy
    if @combination.destroy!
      redirect_to admin_combinations_path
    else
      render :index
    end
  end

  private

  def combination_params
    params.require(:combination).permit(:first_flavor_id, :second_flavor_id, :third_flavor_id, :fourth_flavor_id,
                                        :total_flavors, :sweet_score, :refresh_score, :relax_score, :easy_score, :rating_score)
  end

  def set_categories
    @categories = Category.all.order(id: :asc)
  end

  def set_combination
    @combination = Combination.find(params[:id])
  end
end
