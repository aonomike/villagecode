class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_tags
  	POST_STATUS = ["Not Published","Published"]
end
