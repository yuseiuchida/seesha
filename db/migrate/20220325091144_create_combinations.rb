class CreateCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :combinations do |t|
      t.string :first_flavor
      t.string :second_flavor
      t.string :third_flavor

      t.timestamps
    end
  end
end
