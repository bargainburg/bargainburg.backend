class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
	has_many :PointOfContact
  belongs_to :user

  validates_presence_of [:name, :approved, :email, :phone, :hours, :description, :link, :price_range, :category_id, :address]
  
end
