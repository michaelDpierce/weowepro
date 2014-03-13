class WeoweForm < ActiveRecord::Base
  belongs_to :dealer

  validates_presence_of :customer_first_name
  validates_presence_of :customer_last_name
  validates_presence_of :stock_number
  validates_presence_of :year
  validates_presence_of :make
  validates_presence_of :vehicle_model
  validates_presence_of :color
  validates_presence_of :sold_date
  validates_presence_of :weowe_info
  validates_presence_of :customer_signature
end
