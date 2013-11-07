class Coupon < ActiveRecord::Base
	belongs_to :merchant
	belongs_to :category

   #attr_accessible :image
   has_attached_file :image, :url => "coupons/:id/:basename.:extension"
   validates_attachment_content_type :image, 
	    :content_type => [ 'image/jpg', 'image/png' ], 
	    :message => "File must be of type jpg or png"
   validates_attachment_size :image, :less_than => 2.megabytes
   validates_presence_of [:begin_date, :end_date, :hidden, :name, :category_id, :merchant_id]
   validate :validate_end_after_start
   
   def validate_end_after_start
   	if end_date && begin_date
		errors.add(:end_date, "End Date before Start Date") if end_date < begin_date
	end
   end
end
