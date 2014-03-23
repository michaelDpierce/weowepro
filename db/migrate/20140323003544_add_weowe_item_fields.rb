class AddWeoweItemFields < ActiveRecord::Migration
  def change
    add_column :weowe_items, :description, :text
    add_column :weowe_items, :quantity, :integer
    add_column :weowe_items, :parts_value, :decimal, precision: 8, scale: 2
    add_column :weowe_items, :labor_value, :decimal, precision: 8, scale: 2
  end
end
