class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
	has_many :PointOfContact
<<<<<<< HEAD
  belongs_to :user  
  
  validates_presence_of [:name, :approved, :phone, :price_range, :category_id]
=======
  belongs_to :user

  validates_presence_of [:name, :phone, :price_range, :category_id]
>>>>>>> 523cb0ab82c03947e333e12737c9393041a0bf61
  
  validates_phone_number :merchant, :phone => /(\(\d{3}\) ?)(\d{3}(-|.))?\d{3}(-|.)\d{4}/


  
end
