class CreateWeoweForms < ActiveRecord::Migration
  def change
    create_table :weowe_forms do |t|
      t.integer :weowe_id
      t.integer :duration
      t.integer :invoice_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_address_1
      t.string :customer_address_2
      t.string :customer_city
      t.string :customer_state
      t.string :customer_zip
      t.string :customer_phone_mobile
      t.string :customer_address
      t.string :customer_email
      t.datetime :custom_date
      t.timestamps
    end
  end
end
