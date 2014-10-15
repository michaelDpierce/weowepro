class AddActualCostToWeoweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_actual_1, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_actual_2, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_actual_3, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_actual_4, :decimal, precision: 8, scale: 2
    add_column :weowe_forms, :dealer_actual_5, :decimal, precision: 8, scale: 2
  end
end
