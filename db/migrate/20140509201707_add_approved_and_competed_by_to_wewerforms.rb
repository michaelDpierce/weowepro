class AddApprovedAndCompetedByToWewerforms < ActiveRecord::Migration
  def change
    add_column :weowe_forms, :approved_by, :string
    add_column :weowe_forms, :completed_by, :string
  end
end
