module EventsHelper
	
	def get_events_in_category(category)
        if !category.nil?
            events = Event.where("event_category ilike '%#{category}%'")
        	return events
        end
    end

end
