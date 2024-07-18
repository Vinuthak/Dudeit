class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end

    add_column :stories, :user_id, :integer # which means add column to stories table with the user_ID column of int type
    add_column :votes, :user_id, :integer
  end
end
