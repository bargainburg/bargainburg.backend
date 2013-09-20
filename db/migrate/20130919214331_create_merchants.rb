class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :hours
      t.string :link
      t.string :description
      t.boolean :approved
      t.integer :price_range
	  t.integer :category_id

      t.timestamps
    end
  end
end
