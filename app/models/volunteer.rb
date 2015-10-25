class Volunteer < ActiveRecord::Base	
		extend FriendlyId
	friendly_id :name, use: :slugged

	VOLUNTEER_AREAS = ["Internship","Technology Mentor","Speaker","General Support"]
	ENGAGEMENT_TYPES = ["Specific Event","Part Time","Full Time"]
	REFERRERS =["Google","Our Website","A Friend","Other"]
end
