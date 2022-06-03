class Admin::ReviewCombinationsController < Admin::BaseController
  def destroy
    @review_combination = ReviewCombination.find(params[:id])
    if @review_combination.destroy!
      redirect_to admin_combination_path(id: @review_combination.combination_id)
    else
      redirect_to admin_combination_path(id: @review_combination.combination_id)
    end
  end
end
