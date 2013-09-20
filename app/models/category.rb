class Category < ActiveRecord::Base
	has_many :coupons
	has_many :merchants
end
