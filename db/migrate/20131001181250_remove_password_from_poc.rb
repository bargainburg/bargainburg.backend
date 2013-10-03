class RemovePasswordFromPoc < ActiveRecord::Migration
  def self.up
	  change_table :point_of_contacts do |t|
		  t.remove :password
	  end
  end

  def self.down
	  change_table :point_of_contacts do |t|
		  t.string :password
	  end
  end
end
