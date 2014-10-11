class AddAssignedSalespersonIdToWeoweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :assigned_sales_person_id, :integer
  end
end
