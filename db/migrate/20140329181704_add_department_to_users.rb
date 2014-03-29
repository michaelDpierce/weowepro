class AddDepartmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :department, :string
    remove_column :users, :admin
    remove_column :users, :service
  end
end
