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
    category,time,name,date,desc = package.chomp.split("|")

    Event.create!(:event_category=>category, :event_date=>date,:event_time=>time,:event_name=>name,:event_desc=>desc)
  end
end


# create a role named "admin"
 Role.create!(:name => "super_admin")
 Role.create!(:name => "blog_admin")
 Role.create!(:name => "blog_team")
 Role.create!(:name => "guest")

# assign the admin role to the admin user.  (This bit of rails
# magic creates a user_role record in the database.)
#admin_user.roles << admin_role

