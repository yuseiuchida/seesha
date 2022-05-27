class Flavor < ApplicationRecord
	has_many :combinations, class_name: "Combination", foreign_key: "first_flavor_id", dependent: :destroy
	has_many :combinations, class_name: "Combination", foreign_key: "second_flavor_id", dependent: :destroy
	belongs_to :category

	validates :name, presence: true
	validates :name, uniqueness: true

	mount_uploader :flavor_image, FlavorImageUploader

	def count_combinations
		num = Combination.where(first_flavor_id: self.id).or(Combination.where(second_flavor_id: self.id))
		num.count
	end

  def self.sort(sort_key)
    case sort_key
    when "id"
      return all.order(id: :asc)
    when "category"
      return all.order(category_id: :asc)
    end
  end

  def self.gacha(kind)
    return ids = Flavor.ids.shuffle.take(kind.to_i).sort
  end

end
