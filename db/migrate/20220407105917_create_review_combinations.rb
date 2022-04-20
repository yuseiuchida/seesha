class CreateReviewCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :review_combinations do |t|
      t.references :combination, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.string :sweet
      t.string :refresh
      t.string :relax
      t.string :easy
      t.string :rating, null: false
      t.string :comment
      t.timestamps
    end
  end
end
