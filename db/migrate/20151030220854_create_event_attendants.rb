class CreateEventAttendants < ActiveRecord::Migration
  def self.up
    create_table :event_attendants do |t|
      t.integer :user_id
      t.references :event
      t.timestamps
    end
  end
 
  def self.down
    drop_table :event_attendants
  end
end