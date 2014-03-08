class Dealer < ActiveRecord::Base

  has_many :users
  has_many :weowe_forms

  accepts_nested_attributes_for :users
end
