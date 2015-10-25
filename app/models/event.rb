class Event < ActiveRecord::Base	
		extend FriendlyId
	friendly_id :event_name, use: :slugged

	EVENT_CATEGORIES = ["Ages 7-10","Ages 8-11","Ages 10-13","Ages 12-16"]
end
