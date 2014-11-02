class WeoweForm < ActiveRecord::Base
  belongs_to :dealer
  belongs_to :user

  validates_presence_of :customer_last_name
  validates_presence_of :stock_number
  validates_presence_of :year
  validates_presence_of :make
  validates_presence_of :vehicle_model
  validates_presence_of :sold_date

  validates_length_of :description_1, maximum: 300
  validates_length_of :description_2, maximum: 150
  validates_length_of :description_3, maximum: 150
  validates_length_of :description_4, maximum: 150
  validates_length_of :description_5, maximum: 150

  comma do
    # assigned_salesperson_id 'Assigned Salesperson id'
    user id:'Salesperson id'
    user first_name: 'Salesperson First Name'
    user last_name: 'Sales Person Last Name'
    customer_first_name 'First Name'
    customer_last_name 'Last Name'
    customer_phone_mobile 'Phone Number'
    customer_email 'Email'
    stock_number 'Stock Number'
    year 'Year'
    make 'Make'
    vehicle_model 'Model'
    sold_date 'Date sold'

    description_1 'Description #1'
    quantity_1 'Quantity #1'
    dealer_total_value_1 'Retail #1'
    dealer_wholesale_1 'Wholesale #1'
    dealer_actual_1 'Actual #1'

    description_2 'Description #2'
    quantity_2 'Quantity #2'
    dealer_total_value_2 'Retail #2'
    dealer_wholesale_2 'Wholesale #2'
    dealer_actual_2 'Actual #2'

    description_3 'Description #3'
    quantity_3 'Quantity #3'
    dealer_total_value_3 'Retail #3'
    dealer_wholesale_3 'Wholesale #3'
    dealer_actual_3 'Actual #3'

    description_4 'Description #4'
    quantity_4 'Quantity #4'
    dealer_total_value_4 'Retail #4'
    dealer_wholesale_4 'Wholesale #4'
    dealer_actual_4 'Actual #4'

    description_5 'Description #5'
    quantity_5 'Quantity #5'
    dealer_total_value_5 'Retail #5'
    dealer_wholesale_5 'Wholesale #5'
    dealer_actual_5 'Actual #5'

    dealer_total_value 'Retail Total'
    dealer_wholesale 'Wholesale Total'
    dealer_total_actual 'Actual Total'

    theyowe_info 'Customer Owes'
    customer_total_value 'Customer Total Value'

    created_at 'Created At'
    updated_at 'Updated At'
  end
end
