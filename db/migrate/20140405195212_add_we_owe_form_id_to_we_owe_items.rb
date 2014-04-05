class AddWeOweFormIdToWeOweItems < ActiveRecord::Migration
  def change
    add_column :weowe_items, :weowe_form_id, :integer
  end
end
