class AddActualTotalValueToWeoweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :dealer_total_actual, :decimal, precision: 8, scale: 2
  end
end
