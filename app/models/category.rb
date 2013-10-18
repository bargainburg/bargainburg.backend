class Category < ActiveRecord::Base
	has_many :coupons
	has_many :merchants
	validates_presence_of [:name], :on => :create
end
