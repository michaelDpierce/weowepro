class AddEmailTriggersToWeOweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :approved_trigger, :boolean, default: false
    add_column :weowe_forms, :completed_trigger, :boolean, default: false
  end
end
