class Combination < ApplicationRecord
  belongs_to :first_flavor, class_name: "Flavor"
  belongs_to :second_flavor, class_name: "Flavor"
  belongs_to :third_flavor, class_name: "Flavor", optional: true
  belongs_to :fourth_flavor, class_name: "Flavor", optional: true
  belongs_to :user
  has_many :review_combinations, dependent: :destroy
  has_one :rate, dependent: :destroy
  has_one :coefficient, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :first_flavor_id, uniqueness: { scope: [:second_flavor_id, :third_flavor_id, :fourth_flavor_id] }
  validates :first_flavor_id, :second_flavor_id, :rating_score, :sweet_score, :refresh_score, :relax_score, :easy_score, presence: true
  validate :flavor_unique?
  
  STATUS = ["BAD", "NOT GOOD", "NOT BAD", "GOOD", "VERY GOOD", "EXCELLENT"]
  

  def flavor_unique?
    if fourth_flavor_id.present?
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == fourth_flavor_id || second_flavor_id == fourth_flavor_id || third_flavor_id == fourth_flavor_id
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == third_flavor_id || second_flavor_id == third_flavor_id
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == second_flavor_id
    elsif third_flavor_id.present?
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == third_flavor_id || second_flavor_id == third_flavor_id
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == second_flavor_id
    else
      errors.add('同一のフレーバーは組み合わせれません') if first_flavor_id == second_flavor_id
    end
  end

  def setup
    ids = []
    ids << self.first_flavor_id
    ids << self.second_flavor_id
    ids << self.third_flavor_id if self.third_flavor_id.present?
    ids << self.fourth_flavor_id if self.fourth_flavor_id.present?
    
    name = Flavor.where(id: ids).order(category_id: :asc).map(&:name).join(" ")

    status = Combination::STATUS[self.rating_score]
    self.update(name: name, status: status)
    Coefficient.create(combination_id: self.id)
    Rate.create(combination_id: self.id, sweet_rate: self.sweet_score, refresh_rate: self.refresh_score, relax_rate: self.relax_score, easy_rate: self.easy_score, rating_rate: self.rating_score)
  end

  def set_rate
    reviews = ReviewCombination.where(combination_id: self.id)
    coefficient = Coefficient.find_by(combination_id: self.id)

    if reviews.exists?
      sweet = reviews.where(sweet: ReviewCombination::SWEET[1]).count + self.sweet_score
      refresh = reviews.where(refresh: ReviewCombination::REFRESH[1]).count + self.refresh_score
      relax = reviews.where(relax: ReviewCombination::RELAX[1]).count + self.relax_score 
      easy = reviews.where(easy: ReviewCombination::EASY[1]).count + self.easy_score
      
      a = reviews.where(rating: ReviewCombination::RATING[0]).count * 4
      b = reviews.where(rating: ReviewCombination::RATING[1]).count * 3
      c = reviews.where(rating: ReviewCombination::RATING[2]).count * 2
      d = reviews.where(rating: ReviewCombination::RATING[3]).count
      rating = a + b + c + d + self.rating_score

      not_sweet = reviews.where(sweet: ReviewCombination::SWEET[2]).count
      not_refresh = reviews.where(refresh: ReviewCombination::REFRESH[2]).count
      not_relax = reviews.where(relax: ReviewCombination::RELAX[2]).count
      not_easy = reviews.where(easy: ReviewCombination::EASY[2]).count

      sweet = (sweet.to_f / (sweet.to_f + not_sweet.to_f)).round(2) * coefficient.sweet
      refresh = (refresh.to_f / (refresh.to_f + not_refresh.to_f)).round(2) * coefficient.refresh
      relax = (relax.to_f / (relax.to_f + not_relax.to_f)).round(2) * coefficient.relax
      easy = (easy.to_f / (easy.to_f + not_easy.to_f)).round(2) * coefficient.easy
      rating = (rating.to_f / reviews.count.to_f).round(2) * coefficient.rating
    else
      sweet = self.sweet_score * coefficient.sweet
      refresh = self.refresh_score * coefficient.refresh
      relax = self.relax_score * coefficient.relax
      easy = self.easy_score * coefficient.easy
      rating = self.rating_score * coefficient.rating
    end
    
    Rate.find_by(combination_id: self.id).update(rating_rate: rating, sweet_rate: sweet, refresh_rate: refresh, relax_rate: relax, easy_rate: easy)
  end


end
