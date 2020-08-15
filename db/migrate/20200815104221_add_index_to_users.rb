class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :user, :username, unique: true
    add_index :user, :email, unique: true
  end
end
