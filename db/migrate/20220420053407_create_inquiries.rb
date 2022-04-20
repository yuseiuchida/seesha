class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries, id: :uuid do |t|
      t.string :kind, null: false
      t.string :user_name
      t.string :user_email
      t.string :content, null: false
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
