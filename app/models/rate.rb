class Rate < ApplicationRecord
  belongs_to :combination

  validates :sweet_rate, :refresh_rate, :relax_rate, :easy_rate, :rating_rate, presence: true

  ORDER = %w[高評価 吸いやすい 甘い スッキリ リラックス 一覧]

  def self.sort(sort_key)
    case sort_key
    when Rate::ORDER[0]
      all.order(rating_rate: :desc).limit(16)
    when Rate::ORDER[1]
      all.order(easy_rate: :desc).limit(16)
    when Rate::ORDER[2]
      all.order(sweet_rate: :desc).limit(16)
    when Rate::ORDER[3]
      all.order(refresh_rate: :desc).limit(16)
    when Rate::ORDER[4]
      all.order(relax_rate: :desc).limit(16)
    when Rate::ORDER[5]
      all.order(updated_at: :desc)
    end
  end

  def self.recommend(params)
    easy = if params[:easy] == 'not_smoke'
             Rate.where('easy_rate > ?', 0.7)
           else
             Rate.all
           end

    sweet = if params[:sweet] == 'sweet'
              easy.where('sweet_rate > ?', 0.7)
            else
              easy.where('sweet_rate < ?', 0.3)
            end

    feeling = if params[:feeling] == 'refresh'
                sweet.where('refresh_rate > ?', 0.7)
              elsif params[:feeling] == 'relax'
                sweet.where('relax_rate > ?', 0.7)
              else
                sweet
              end

    ids = []

    if params[:what] == 'popular'
      rates = feeling.where('rating_rate > ?', 3.5)
      rates.each do |rate|
        ids << rate.combination_id
      end
    elsif params[:what] == 'unique'
      rates = feeling.where('rating_rate < ?', 3.0)
      rates.each do |rate|
        ids << rate.combination_id
      end
    elsif params[:what] == 'alcohol'
      feeling.each do |rate|
        if rate.combination.first_flavor.category.name == 'アルコール' or rate.combination.second_flavor.category.name == 'アルコール'
          ids << rate.combination_id
        end
      end
    else
      feeling.each do |rate|
        ids << rate.combination_id
      end
    end

    return Combination.where(id: ids) if ids.present?
  end
end
