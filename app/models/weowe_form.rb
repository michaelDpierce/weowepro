class WeoweForm < ActiveRecord::Base
  belongs_to :dealer
  belongs_to :user

  validates_presence_of :customer_first_name
  validates_presence_of :customer_last_name
  validates_presence_of :stock_number
  validates_presence_of :year
  validates_presence_of :make
  validates_presence_of :vehicle_model
  validates_presence_of :color
  validates_presence_of :sold_date

  validates_length_of :description_1, :maximum => 35
  validates_length_of :description_2, :maximum => 35
  validates_length_of :description_3, :maximum => 35
  validates_length_of :description_4, :maximum => 35
  validates_length_of :description_5, :maximum => 35

  comma do
    user first_name: 'Salesperson First Name'
    user last_name: 'Sales Person Last Name'
    customer_first_name 'First Name'
    customer_last_name 'Last Name'
    customer_phone_mobile 'Phone Number'
    customer_email 'Email'
    theyowe_info 'Customer Owes'
    customer_total_value 'Customer Total Value'
    stock_number 'Stock Number'
    year 'Year'
    make 'Make'
    vehicle_model 'Model'
    custom_date 'Custom Date'
    description_1 'Description #1'
    quantity_1 'Quantity #1'
    dealer_total_value_1 'Dealer Total Value #1'
    description_2 'Description #2'
    quantity_2 'Quantity #2'
    dealer_total_value_2 'Dealer Total Value #2'
    description_3 'Description #3'
    quantity_3 'Quantity #3'
    dealer_total_value_3 'Dealer Total Value #3'
    description_4 'Description #4'
    quantity_4 'Quantity #4'
    dealer_total_value_4 'Dealer Total Value #4'
    description_5 'Description #5'
    quantity_5 'Quantity #5'
    dealer_total_value_5 'Dealer Total Value #5'
    created_at 'Created At'
    updated_at 'Updated At'
  end

  def self.lightning
    connection.select_all(select([:id, :custom_date, :stock_number, :year, :make, :vehicle_model, :color, :customer_last_name, :customer_first_name, :dealer_total_value]).arel).each do |attrs|
      attrs.each_key do |attr|
        attrs[attr] = type_cast_attribute(attr, attrs)
      end
    end
  end

end
