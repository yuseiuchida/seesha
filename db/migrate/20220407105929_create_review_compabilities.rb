class CreateReviewCompabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :review_compabilities do |t|
      t.references :compability, foreign_key: true
      t.references :user, foreign_key: true
      t.string :opinion, null: false
      t.string :comment

      t.timestamps
    end
  end
end
