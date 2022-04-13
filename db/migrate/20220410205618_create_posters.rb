class CreatePosters < ActiveRecord::Migration[6.1]
  def change
    create_table :posters do |t|
      t.references :combination, foreign_key: true
      t.float :sweet
      t.float :refresh
      t.float :relax
      t.float :easy
      t.float :opinion
      t.timestamps
    end
  end
end
