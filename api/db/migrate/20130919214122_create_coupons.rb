class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.datetime :begin_date
      t.datetime :end_date
      t.datetime :created_date
      t.string :description
      t.string :image
      t.boolean :hidden
      t.string :name

      t.timestamps
    end
  end
end
