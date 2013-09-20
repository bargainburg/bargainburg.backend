class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
	has_many :point_of_contact
end
