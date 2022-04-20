class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :combination, foreign_key: true
      t.timestamps
    end
    add_index :bookmarks, [:user_id, :combination_id], unique: true
  end
end
