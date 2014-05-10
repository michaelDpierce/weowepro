class AddWholesaleToWeoweforms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_wholesale_1, :integer
    add_column :weowe_forms, :dealer_wholesale_2, :integer
    add_column :weowe_forms, :dealer_wholesale_3, :integer
    add_column :weowe_forms, :dealer_wholesale_4, :integer
    add_column :weowe_forms, :dealer_wholesale_5, :integer
  end
end
