class CreateCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :combinations do |t|
      t.references :first_flavor, forein_key: {to_table: :flavors}
      t.references :second_flavor, forein_key: {to_table: :flavors}
      t.string :status
      t.string :name
      t.integer :rating_score, null: false
      t.integer :sweet_score, null: false
      t.integer :refresh_score, null: false
      t.integer :relax_score, null: false
      t.integer :easy_score, null: false
      t.timestamps
    end
    add_index :combinations, [:first_flavor_id, :second_flavor_id], unique: true 
  end
end
