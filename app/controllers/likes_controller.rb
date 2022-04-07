class LikesController < ApplicationController
  def create
    combination = Combination.find(params[:combination_id])
    Like.create(user: current_user, combination: combination)
    redirect_to combinations_path
  end

  def destroy
    combination = current_user.likes.find(params[:id]).combination
    current_user.unlike(combination)
    redirect_to combinations_path
  end
end
