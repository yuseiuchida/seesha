class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name,             null: false, index: { unique: true }
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.integer :role, default: 0
      t.string :avatar

      t.timestamps null: false
    end
  end
end
