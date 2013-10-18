class PointOfContact < ActiveRecord::Base
	belongs_to :Merchant
	validate_presence_of [:name, :email, :phone, :merchant_id], :on => create
end
