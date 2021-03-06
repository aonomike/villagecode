class Post < ActiveRecord::Base
		extend FriendlyId
	friendly_id :post_title, use: :slugged

	belongs_to :user
	has_many :comments
	has_many :post_tags
  	POST_STATUS = ["Not Published","Published"]
  	POST_TYPES = ["QUOTE","DEFAULT"]

  	has_attached_file :picture,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {:path => proc { |style| "posts/#{style}/#{id}_#{picture.original_filename}" }}

    validates_attachment_content_type :picture,
     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
     :message => "Different error message",
     :if => :is_type_of_image?

  def tags_list
      self.post_tags.map{|t| t.tag}.join(",")
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.post_tags = tag_names.map { |tag| PostTag.where('tag = ?', tag).first or PostTag.create(:tag => tag) }
  end

	protected
	  def is_type_of_image?
	    picture.content_type =~ %r(image)
	  end

end
