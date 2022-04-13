class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.references :combination, foreign_key: true
      t.float :sweet
      t.float :refresh
      t.float :relax
      t.float :easy
      t.float :opinion
      t.string :opinion_status
      t.timestamps
    end
  end
end
