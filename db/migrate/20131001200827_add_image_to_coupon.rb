class AddImageToCoupon < ActiveRecord::Migration
  def self.up
    add_attachment :coupons, :image
  end

  def self.down
    remove_attachment :coupons, :image
  end
end
