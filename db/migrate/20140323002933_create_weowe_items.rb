class CreateWeoweItems < ActiveRecord::Migration
  def change
    create_table :weowe_items do |t|
      t.timestamps
    end
  end
end
