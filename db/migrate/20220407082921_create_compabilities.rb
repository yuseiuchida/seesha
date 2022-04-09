class CreateCompabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :compabilities do |t|
      t.references :main_combination, foreign_key: {to_table: :combinations}
      t.references :sub_combination, foreign_key: {to_table: :combinations}
      t.string :kind, null: false
      t.integer :score
      t.timestamps
    end
  end
end
