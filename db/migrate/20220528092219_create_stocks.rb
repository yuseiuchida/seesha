class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.references :flavor, foreign_key: true
      t.references :shop, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
