class CreatePointOfContacts < ActiveRecord::Migration
  def change
    create_table :point_of_contacts do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
