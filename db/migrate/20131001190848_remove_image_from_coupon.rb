class RemoveImageFromCoupon < ActiveRecord::Migration
  def change
	  change_table :coupons do |t|
		  t.remove :image
	  end
  end
end
