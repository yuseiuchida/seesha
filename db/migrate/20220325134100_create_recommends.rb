class CreateRecommends < ActiveRecord::Migration[6.1]
  def change
    create_table :recommends do |t|
      t.string :target, null: false
      t.string :taste, null: false
      t.string :refresh, null: false
      t.string :alcohol, null: false
      t.timestamps
    end
  end
end
