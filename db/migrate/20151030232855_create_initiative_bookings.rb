class CreateInitiativeBookings < ActiveRecord::Migration
  def self.up
    create_table :initiative_bookings do |t|
      t.integer :user_id
      t.string :time
      t.references :initiative
      t.timestamps
    end
  end
 
  def self.down
    drop_table :initiative_bookings
  end
end