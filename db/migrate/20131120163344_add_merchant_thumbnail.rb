class AddMerchantThumbnail < ActiveRecord::Migration

	def self.up
		add_column :merchants, :image_name, :string
		add_column :merchants, :image_size, :integer
	end
	def self.down
		remove_column :merchants, :image_name
		remove_column :merchants, :image_size
	end
end
