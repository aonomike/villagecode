class Event < ActiveRecord::Base	
		extend FriendlyId
	friendly_id :event_name, use: :slugged

	EVENT_CATEGORIES = ["Ages 7-10","Ages 8-11","Ages 10-13","Ages 12-16"]

	has_attached_file :picture,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {:path => proc { |style| "events/#{style}/#{id}_#{picture.original_filename}" }}

    validates_attachment_content_type :picture,
     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
     :message => "Different error message",
     :if => :is_type_of_image?

	protected
	  def is_type_of_image?
	    picture.content_type =~ %r(image)
	  end
end
