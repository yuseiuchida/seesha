class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.string :area
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :status, deault: 0
      t.string :link
      t.string :content
      t.timestamps
    end
  end
end
