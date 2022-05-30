class Shop < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :stock_flavors, through: :stocks, source: :flavor
  belongs_to :user
  has_many :shop_images, dependent: :destroy

  validates :name, :area, presence: true
  validates :name, uniqueness: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed? 

  enum status: { open: 0, close: 1, hidden: 2 }

  AREA = ["北海道 東北", "関東", "東京", "東海 北陸", "関西", "中国 四国", "九州 沖縄"]


  def geocoding
    latlon = Geocoder.search(self.address).first.coordinates
    self.update(latitude: latlon[0], longitude: latlon[1])
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
end
