class CreateShopImages < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_images, id: :uuid do |t|
      t.references :shop, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.string :image
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
