class AddUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :photo_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :access_token, :string
  end
end
