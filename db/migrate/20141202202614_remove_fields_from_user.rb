class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :uid
    remove_column :users, :access_token
  end
end
