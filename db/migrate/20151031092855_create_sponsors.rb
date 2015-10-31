class CreateSponsors < ActiveRecord::Migration
	def change
	    create_table :sponsors do |t|
		  t.column :name, :string
		  t.column :email, :text
		  t.column :slug, :string
		  t.column :referrer, :string
		  t.column :message, :string
  		  t.timestamps
	    end
	
		add_index :sponsors, :email
		add_index :sponsors, :slug,                :unique => true
		add_index :sponsors, :name
	end
end