class DescriptionToText < ActiveRecord::Migration
  def self.up
    change_column :coupons, :description, :text
    change_column :merchants, :description, :text
  end

  def self.down
    change_column :coupons, :description, :string
    change_column :merchants, :description, :string
  end
end
