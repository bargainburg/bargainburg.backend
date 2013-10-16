class DescriptionToTextLimit < ActiveRecord::Migration
  def self.up
    change_column :coupons, :description, :text, :limit => nil
    change_column :merchants, :description, :text, :limit => nil
  end

  def self.down
    change_column :coupons, :description, :string
    change_column :merchants, :description, :string
  end
end
