class AddDealershipTotalOwed < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_parts_value, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_labor_value, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_total_value, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :customer_total_value, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :status, :boolean
  end
end
