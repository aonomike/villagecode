class CreateVolunteers < ActiveRecord::Migration
	def change
	    create_table :volunteers do |t|
		  t.column :name, :string
		  t.column :area, :string
		  t.column :engagement, :string
		  t.column :email, :text,                :unique => true
		  t.column :slug, :string
		  t.column :referrer, :string
		  t.column :additional_comments, :string
  		  t.timestamps
	    end
	
		add_index :volunteers, :email,                :unique => true
		add_index :volunteers, :slug,                :unique => true
	end
end