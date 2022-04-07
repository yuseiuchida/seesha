class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :combination, foreign_key: true
      t.timestamps
    end
    add_index :likes, [:user_id, :combination_id], unique: true
  end
end
