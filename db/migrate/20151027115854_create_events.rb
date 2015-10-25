class CreateEvents < ActiveRecord::Migration
	def change
	    create_table :events do |t|
		  t.column :event_name, :text,                :unique => true
		  t.column :event_date, :text
		  t.column :event_time, :text
		  t.column :event_desc, :text
		  t.column :event_category, :text
		  t.timestamps
	    end
	
		add_index :events, :event_name,                :unique => true
	end
end