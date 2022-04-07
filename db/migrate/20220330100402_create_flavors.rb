class CreateFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :flavors do |t|
      t.string :name, null: false
      t.references :category, forein_key: true
      t.timestamps
    end
  end
end
