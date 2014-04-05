class WeoweForm < ActiveRecord::Base
  belongs_to :dealer
  belongs_to :user

  has_many :weowe_items, dependent: :destroy

  accepts_nested_attributes_for :weowe_items,
                                reject_if: -> (weowe_item) { weowe_item[:description].blank? },
                                allow_destroy: true

  validates_presence_of :customer_first_name
  validates_presence_of :customer_last_name
  validates_presence_of :stock_number
  validates_presence_of :year
  validates_presence_of :make
  validates_presence_of :vehicle_model
  validates_presence_of :color
  validates_presence_of :sold_date
end
