class Merchant < ActiveRecord::Base
	has_many :coupons
	belongs_to :category
	has_many :PointOfContact
  belongs_to :user
<<<<<<< HEAD
=======

  validates_presence_of [:name, :phone, :price_range, :category_id, :user_id]
>>>>>>> a1ef5edad3b67e00f8e7a70818142616d1c3c99a
  
  has_attached_file :pic, :style =>{:thumb => "150x150>"}
  
  validates_presence_of [:name, :phone, :price_range, :category_id]
  validate_attachment_presence :pic
  validate_attachment_size :pic, :less_than=>5.megabytes
  validate_attachment_content_type :pic, :content_type=>['image/jpeg', 'image/png']
end
