class Category < ActiveRecord::Base
	has_many :coupons
	has_many :merchants, :order => 'name ASC' #order the merchants within the category in alphabetical order
end
