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
end
