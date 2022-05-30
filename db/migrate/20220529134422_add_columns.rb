class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_reference :flavors, :user, type: :uuid, foreign_key: true
    add_column :flavors, :content, :string
    add_reference :combinations, :user, type: :uuid, foreign_key: true
  end
end
