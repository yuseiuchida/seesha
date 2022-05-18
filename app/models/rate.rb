class Rate < ApplicationRecord
	belongs_to :combination

	validates :sweet_rate, :refresh_rate, :relax_rate, :easy_rate, :rating_rate, presence: true

	ORDER = ["高評価", "吸いやすい", "甘い", "スッキリ", "リラックス", "一覧"]

	def self.sort(sort_key)
		case sort_key
		when Rate::ORDER[0]
			return all.order(rating_rate: :desc).limit(16)
		when Rate::ORDER[1]
			return all.order(easy_rate: :desc).limit(16)
		when Rate::ORDER[2]
			return all.order(sweet_rate: :desc).limit(16)
		when Rate::ORDER[3]
			return all.order(refresh_rate: :desc).limit(16)
		when Rate::ORDER[4]
			return all.order(relax_rate: :desc).limit(16)
		when Rate::ORDER[5]
			return all.order(updated_at: :desc)
		end
	end

	def self.recommend(params)
		if params[:easy] == "not_smoke"
			easy = Rate.where("easy_rate > ?", 0.7)
		else
			easy = Rate.all
		end

		if params[:sweet] == "sweet"
			sweet = easy.where("sweet_rate > ?", 0.7)
		else
			sweet = easy.where("sweet_rate < ?", 0.3)
		end

		if params[:feeling] == "refresh"
			feeling = sweet.where("refresh_rate > ?", 0.7)
		elsif params[:feeling] == "relax"
			feeling = sweet.where("relax_rate > ?", 0.7)
		else
			feeling = sweet
		end

		if params[:what] == "popular"
			rates = feeling.where("rating_rate > ?", 3.5)
			ids = []
			rates.each do |rate|
				ids << rate.id
			end
		elsif params[:what] == "unique"
			rates = feeling.where("rating_rate < ?", 3.0)
			ids = []
			rates.each do |rate|
				ids << rate.id
			end
		elsif params[:what] == "alcohol"
			ids = []
			feeling.each do |rate|
				if rate.combination.first_flavor.category.name == "アルコール系" or rate.combination.second_flavor.category.name == "アルコール系"
					ids << rate.id
				end
			end
		else
			feeling.each do |rate|
				ids << rate.id
			end
		end
		@search_combination = Combination.find(Rate.find(ids.sample).combination_id) if ids.present?
	end
end
