class GathersController < ApplicationController
  before_action :set_items
  def create
    @flavor.gather(@hint)
  end

  def destroy
    @flavor.ungather(@hint)
  end

  private

  def set_items
    @flavor = Flavor.find(params[:flavor_id])
    @hint = Hint.find(params[:hint_id])
  end
end
