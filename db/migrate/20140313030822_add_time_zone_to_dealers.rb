class AddTimeZoneToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :time_zone, :string
  end
end
