class Dealer < ActiveRecord::Base

  has_many :users
  has_many :weowe_forms

  validates_presence_of :name
  validates_presence_of :address_1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_inclusion_of :time_zone

   validates_inclusion_of :time_zone,
                         in: ActiveSupport::TimeZone.zones_map(&:name)
end
