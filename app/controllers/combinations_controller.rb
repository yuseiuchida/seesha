class CombinationsController < ApplicationController
	before_action :set_flavors, only: %i[new create]
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
	end

	def create
		@combination = Combination.new(combination_params)
		if @combination.save
			@combination.setup
			redirect_to combination_path(@combination), success: "コンビネーション「#{@combination.name}」が追加されました"
		else
			flash.now[:danger] = '入力に誤りがあるか、既に登録されたフレーバーです'
			render :new
		end
	end

	def show
		@combination = Combination.find(params[:id])
		@compabilities = Compability.where(main_combination_id: @combination.id)
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
		params.require(:combination).permit(:first_flavor_id, :second_flavor_id, :sweet_score, :refresh_score, :relax_score, :easy_score, :rating_score)
	end

	def set_flavors
		@flavors = Flavor.all
	end

  def set_q
    @q = Combination.ransack(params[:q])
  end
end
