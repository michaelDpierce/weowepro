class AddPendingAndCompletedToWeOweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :pending, :boolean, default: true
    add_column :weowe_forms, :completed, :boolean, default: false
  end
end
