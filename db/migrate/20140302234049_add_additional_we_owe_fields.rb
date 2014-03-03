class AddAdditionalWeOweFields < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :stock_number, :string
    add_column :weowe_forms, :year, :integer
    add_column :weowe_forms, :make, :string
    add_column :weowe_forms, :model, :string
    add_column :weowe_forms, :sold_date, :datetime
    add_column :weowe_forms, :salesman_first_name, :string
    add_column :weowe_forms, :salesman_last_name, :string
    add_column :weowe_forms, :weowe_info, :text
    add_column :weowe_forms, :theyowe_info, :text
    add_column :weowe_forms, :salesman_signature, :string
    add_column :weowe_forms, :customer_signature, :string
  end
end
