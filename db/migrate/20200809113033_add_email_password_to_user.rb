class AddEmailPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :email, :string
    add_column :user, :password_hash, :string
    add_column :user, :password_salt, :string

    add_column :user, :avatar_url, :string
  end
end
