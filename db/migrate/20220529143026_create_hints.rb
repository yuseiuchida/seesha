class CreateHints < ActiveRecord::Migration[6.1]
  def change
    create_table :hints do |t|
      t.string :content, null: false
      t.timestamps
    end
  end
end
