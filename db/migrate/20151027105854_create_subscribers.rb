class CreateSubscribers < ActiveRecord::Migration
	def change
	    create_table :subscribers do |t|
		  t.column :email, :text,                :unique => true
		  t.timestamps
	    end
	
		add_index :subscribers, :email,                :unique => true
	end
end