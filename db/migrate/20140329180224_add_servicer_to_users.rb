class AddServicerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :service, :boolean, default: false
  end
end
