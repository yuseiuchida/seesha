class GachaController < ApplicationController
  skip_before_action :require_login, only: %i[new]
  def new
    @combination = Combination.gacha
    if Combination.find_by(name: @combination.name)
      @combination = Combination.find_by(name: @combination.name)
    end
  end
end
