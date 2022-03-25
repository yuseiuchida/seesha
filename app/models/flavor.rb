class Flavor < ApplicationRecord
	validates :name, presence: true
end
