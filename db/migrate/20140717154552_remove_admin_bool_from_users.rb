class RemoveAdminBoolFromUsers < ActiveRecord::Migration
  def change
  	add_column :trees, :rand_given, :integer
  	remove_column :events, :owner_id
  	remove_column :trees, :name
  	remove_column :users, :admin
  end
end
