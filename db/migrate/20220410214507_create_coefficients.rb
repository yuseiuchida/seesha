class CreateCoefficients < ActiveRecord::Migration[6.1]
  def change
    create_table :coefficients do |t|
      t.references :combination, foreign_key: true
      t.float :sweet, default: 1
      t.float :refresh, default: 1
      t.float :relax, default: 1
      t.float :easy, default: 1
      t.float :rating, default: 1
      t.timestamps
    end
  end
end
