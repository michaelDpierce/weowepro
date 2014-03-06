class WeoweForm < ActiveRecord::Base

  def self.search(search)
    if search
      where('customer_last_name LIKE ? OR
             customer_first_name LIKE ? OR
             stock_number LIKE ? OR
             year LIKE ? OR
             make LIKE ? OR
             vehicle_model LIKE ? OR
             color LIKE ? OR
             dealer_total_value LIKE ?',
             "%#{search}%",
             "%#{search}%",
             "%#{search}%",
             "%#{search}%",
             "%#{search}%",
             "%#{search}%",
             "%#{search}%",
             "%#{search}%")
    else
      scoped
    end
  end

end
