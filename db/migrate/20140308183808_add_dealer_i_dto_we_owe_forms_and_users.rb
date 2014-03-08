class AddDealerIDtoWeOweFormsAndUsers < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_id, :integer
    add_column :weowe_forms, :user_id, :integer
    add_column :users, :dealer_id, :integer
  end
end
