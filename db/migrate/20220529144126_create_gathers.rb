class CreateGathers < ActiveRecord::Migration[6.1]
  def change
    create_table :gathers do |t|
      t.references :flavor, foreign_key: true
      t.references :hint, foreign_key: true
      t.timestamps
    end
  end
end
