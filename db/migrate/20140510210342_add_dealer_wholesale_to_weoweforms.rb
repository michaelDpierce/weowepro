class AddDealerWholesaleToWeoweforms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_wholesale, :decimal, precision: 8, scale: 2
    remove_column :weowe_forms, :dealer_wholesale_1
    remove_column :weowe_forms, :dealer_wholesale_2
    remove_column :weowe_forms, :dealer_wholesale_3
    remove_column :weowe_forms, :dealer_wholesale_4
    remove_column :weowe_forms, :dealer_wholesale_5
    add_column :weowe_forms, :dealer_wholesale_1, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_wholesale_2, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_wholesale_3, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_wholesale_4, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_wholesale_5, :decimal, precision: 8, scale: 2
  end
end
