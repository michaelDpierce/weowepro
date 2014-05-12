class RemoveUnneededWeoweformColumns < ActiveRecord::Migration
  def change
    remove_column :weowe_forms, :customer_address_1
    remove_column :weowe_forms, :customer_address_2
    remove_column :weowe_forms, :customer_city
    remove_column :weowe_forms, :customer_state
    remove_column :weowe_forms, :customer_zip
    remove_column :weowe_forms, :customer_address
    remove_column :weowe_forms, :salesman_first_name
    remove_column :weowe_forms, :salesman_last_name
    remove_column :weowe_forms, :weowe_info
    remove_column :weowe_forms, :customer_signature
    remove_column :weowe_forms, :dealer_parts_value
    remove_column :weowe_forms, :dealer_labor_value
    remove_column :weowe_forms, :age
    # remove_column :weowe_forms, :name_confirmation
    # remove_column :weowe_forms, :signature
    remove_column :weowe_forms, :approved_trigger
    remove_column :weowe_forms, :completed_trigger
  end
end
