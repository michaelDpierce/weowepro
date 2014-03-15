class AddAgeToWeOweForms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :age, :datetime
  end
end
