# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
File.open(File.join(Rails.root, 'db', 'default')) do |f|
  f.each_line do |package|
  	#Ages 12-16 | 7:00pm - 08:00pm | Dive into Linux|12/09/2015
    category,time,name,date = package.chomp.split("|")

    Event.create!(:event_category=>category, :event_date=>date,:event_time=>time,:event_name=>name)
  end
end

