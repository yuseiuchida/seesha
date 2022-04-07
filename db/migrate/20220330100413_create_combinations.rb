class CreateCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :combinations do |t|
      t.references :first_flavor, forein_key: {to_table: :flavors}
      t.references :second_flavor, forein_key: {to_table: :flavors}
      t.string :content
      t.string :keyword, null: false


      t.timestamps
    end
  end
end
