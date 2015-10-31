class Initiative < ActiveRecord::Base
		extend FriendlyId
	friendly_id :sans_html_name, use: :slugged	
	has_many :initiative_bookings
end
