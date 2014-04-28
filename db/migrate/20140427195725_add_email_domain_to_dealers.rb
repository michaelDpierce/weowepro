class AddEmailDomainToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :email_domain, :string
  end
end
