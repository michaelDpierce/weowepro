class UpdateWeOweColumns < ActiveRecord::Migration
  def change
    remove_column :weowe_forms, :model
    add_column :weowe_forms, :vehicle_model, :string
    add_column :weowe_forms, :color, :string
  end
end
