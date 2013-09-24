class ChangeAssociations < ActiveRecord::Migration
  def change
	  change_table :coupons do |t|
		  t.remove :category_id
		  t.remove :merchant_id
		  t.belongs_to :category
		  t.belongs_to :merchant
	  end

	  change_table :merchants do |t|
		  t.remove :category_id
		  t.belongs_to :category
	  end

	  change_table :point_of_contacts do |t|
		  t.belongs_to :merchant
	  end
  end
end
