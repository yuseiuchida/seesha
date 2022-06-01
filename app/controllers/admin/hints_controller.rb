class Admin::HintsController < Admin::BaseController
  before_action :set_category, only: %i[show edit update]

  def index
    @hints = Hint.all
  end

  def new
    @hint = Hint.new
  end

  def create
    @hint = Hint.new(hint_params)
    if @hint.save
      redirect_to admin_hints_path
    else
      render :new
    end
  end

  def destroy
    @hint = Hint.find(params[:id])
    if @hint.destroy!
      redirect_to admin_hints_path
    else
      render :index
    end
  end

  private

  def hint_params
    params.require(:hint).permit(:content)
  end
end
