class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :dealership

      t.timestamps
    end
  end
end
