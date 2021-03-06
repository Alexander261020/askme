class AddEmailPasswordToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string

    add_column :users, :avatar_url, :string
  end
end
