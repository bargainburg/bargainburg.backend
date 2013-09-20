class CreatePointOfContacts < ActiveRecord::Migration
  def change
    create_table :point_of_contacts do |t|
      t.string :name
      t.string :phone
      t.string :companyName
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
