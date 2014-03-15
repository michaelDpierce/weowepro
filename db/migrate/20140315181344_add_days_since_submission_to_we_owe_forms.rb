class AddDaysSinceSubmissionToWeOweForms < ActiveRecord::Migration
  def change
    remove_column :weowe_forms, :invoice_id
    remove_column :weowe_forms, :duration
    remove_column :weowe_forms, :salesman_signature
    remove_column :weowe_forms, :status
  end
end
