class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.references :combination, foreign_key: true
      t.integer :sweet_rate
      t.integer :refresh_rate
      t.integer :relax_rate
      t.integer :easy_rate
      t.integer :score
      t.timestamps
    end
  end
end
