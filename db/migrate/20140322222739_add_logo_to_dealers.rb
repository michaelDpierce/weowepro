class AddLogoToDealers < ActiveRecord::Migration
  def change
     add_attachment :dealers, :logo
  end
end
