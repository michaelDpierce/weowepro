class AddNewDealerAttributes < ActiveRecord::Migration
  def change
    add_column :dealers, :address_1, :string
    add_column :dealers, :address_2, :string
    add_column :dealers, :city, :string
    add_column :dealers, :state, :string
    add_column :dealers, :zip, :string
    add_column :dealers, :phone_number, :string
  end
end
