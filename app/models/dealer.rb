class Dealer < ActiveRecord::Base
  has_many :users
  has_many :weowe_forms

  validates_presence_of :name
  validates_presence_of :address_1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_inclusion_of :time_zone,
                         in: ActiveSupport::TimeZone.zones_map(&:name)

  ATTACHED_PATH = ':rails_root/public/system/:attachment/:id/:style/:filename'

  has_attached_file :logo,
                    path: ATTACHED_PATH,
                    url: '/system/:attachment/:id/:style/:filename'

  validates_attachment :logo, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png'] }
end
