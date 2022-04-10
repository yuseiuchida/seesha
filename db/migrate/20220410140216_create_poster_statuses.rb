class CreatePosterStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :poster_statuses do |t|
      t.references :combination, foreign_key: true
      t.string :opinion
      t.string :sweet
      t.string :refresh
      t.string :relax
      t.string :easy
      t.timestamps
    end
  end
end
