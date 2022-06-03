class Coefficient < ApplicationRecord
  belongs_to :combination

  NUMBER = [0.8, 1.0, 1.2]

  def setup_rate
    rate = Rate.find_by(combination_id: combination_id)
    fluctuating = FluctuatingRate.find_by(combination_id: combination_id)
    opinion = rate.opinion * self.opinion
    sweet = rate.sweet * self.sweet
    refresh = rate.refresh * self.refresh
    relax = rate.relax * self.relax
    easy = rate.easy * self.easy
    fluctuating.update(opinion: opinion, sweet: sweet, refresh: refresh, relax: relax, easy: easy)
  end
end
