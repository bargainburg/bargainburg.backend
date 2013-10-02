class RemoveCouponCreatedExtra < ActiveRecord::Migration
  def change
	  change_table :coupons do |t|
		  t.remove :created_date
	  end
  end
end
