class Admin::CoefficientsController < Admin::BaseController
  def edit
    @coefficient = Coefficient.find_by(combination_id: params[:id])
    @combination = Combination.find_by(id: @coefficient.combination_id)
  end

  def update
    @coefficient = Coefficient.find_by(combination_id: params[:id])
    if @coefficient.update(coefficient_params)
      Combination.find(@coefficient.combination_id).set_rate
      redirect_to admin_combination_path(id: @coefficient.combination_id)
    else
      render :edit
    end
  end

  private

  def coefficient_params
    params.require(:coefficient).permit(:rating, :sweet, :refresh, :relax, :easy)
  end
end
