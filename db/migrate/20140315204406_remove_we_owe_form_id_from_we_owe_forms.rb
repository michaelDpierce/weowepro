class RemoveWeOweFormIdFromWeOweForms < ActiveRecord::Migration
  def change
    remove_column :weowe_forms, :weowe_id
  end
end
