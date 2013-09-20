class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
end
