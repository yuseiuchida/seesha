class Shop < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :stock_flavors, through: :stocks, source: :flavor
  belongs_to :user
  has_many :shop_images, dependent: :destroy

  validates :name, :area, presence: true
  validates :name, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum status: { open: 0, close: 1 }
  enum area: { "北海道": 0, "東北": 1, "関東": 2, "都内": 3, "東海": 4, "北陸": 5, "関西": 6, "中国 四国": 7, "九州": 8, " 沖縄": 9 }

  def geocoding
    latlon = Geocoder.search(address).first.coordinates
    update(latitude: latlon[0], longitude: latlon[1])
  end

  def stock(flavor)
    stock_flavors << flavor
  end

  def unstock(flavor)
    stock_flavors.delete(flavor)
  end

  def stock?(flavor)
    stock_flavors.include?(flavor)
  end

  def fixed(flavor)
    stocks.find_by(flavor_id: flavor.id).update(status: 1)
  end

  def unfixed(flavor)
    stocks.find_by(flavor_id: flavor.id).update(status: 0)
  end

  def status?(flavor)
    stocks.find_by(flavor_id: flavor.id).status == Stock.statuses.keys[1]
  end

  def stock_empty
    stocks.where(status: 0).destroy_all
  end

  def stock_all
    stock_empty
    ids = stocks.map(&:flavor_id)
    stock_flavors << Flavor.where.not(id: ids)
  end
end
