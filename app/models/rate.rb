class Rate < ApplicationRecord
	belongs_to :combination

	validates :sweet_rate, :refresh_rate, :relax_rate, :easy_rate, :rating_rate, presence: true

end
