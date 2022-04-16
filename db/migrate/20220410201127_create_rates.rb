class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.references :combination, foreign_key: true
      t.float :sweet_rate
      t.float :refresh_rate
      t.float :relax_rate
      t.float :easy_rate
      t.float :rating_rate
      t.timestamps
    end
  end
end
