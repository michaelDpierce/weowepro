class AddWeOweItemsToWeOweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :description_1, :text
    add_column :weowe_forms, :quantity_1, :integer
    add_column :weowe_forms, :dealer_total_value_1, :decimal, precision: 8, scale: 2

    add_column :weowe_forms, :description_2, :text
    add_column :weowe_forms, :quantity_2, :integer
    add_column :weowe_forms, :dealer_total_value_2, :decimal, precision: 8, scale: 2

    add_column :weowe_forms, :description_3, :text
    add_column :weowe_forms, :quantity_3, :integer
    add_column :weowe_forms, :dealer_total_value_3, :decimal, precision: 8, scale: 2

    add_column :weowe_forms, :description_4, :text
    add_column :weowe_forms, :quantity_4, :integer
    add_column :weowe_forms, :dealer_total_value_4, :decimal, precision: 8, scale: 2

    add_column :weowe_forms, :description_5, :text
    add_column :weowe_forms, :quantity_5, :integer
    add_column :weowe_forms, :dealer_total_value_5, :decimal, precision: 8, scale: 2
  end
end

