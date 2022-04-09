class CreateReviewCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :review_combinations do |t|
      t.references :combination, foreign_key: true
      t.references :user, foreign_key: true
      t.string :sweet
      t.string :refresh
      t.string :easy
      t.string :opinion, null: false
      t.string :comment
      t.timestamps
    end
  end
end
