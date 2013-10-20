class PointOfContact < ActiveRecord::Base
	belongs_to :Merchant
	validates_presence_of [:name, :email, :phone, :merchant_id] 

end
