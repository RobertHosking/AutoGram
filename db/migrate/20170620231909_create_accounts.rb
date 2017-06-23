class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.text :tags
      t.text :comments
      t.integer :amount
      t.integer :comment_percentage
      t.string :instagram_token
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
