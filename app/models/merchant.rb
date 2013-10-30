class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
	has_many :PointOfContact
  belongs_to :user
  
  validates_phone_number :merchant, :phone => /(\(\d{3}\) ?)(\d{3}(-|.))?\d{3}(-|.)\d{4}/
  
end
