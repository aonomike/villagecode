class VisitorsController < ApplicationController

	def about
		@title = "About"
		@page_items = Page.find_by_name(params[:action]).page_items
	end

	def index
  		
	end

	def codeclub
		@title = "Code Club"
		@initiatives = Initiative.where(:initiative_category=>params[:action])
	end

	def tbc
		@title = "Teen Business Challenge"
		@page_items = Page.find_by_name(params[:action]).page_items
	end

	def make
		@title = "Makers"
		@initiatives = Initiative.where(:initiative_category=>params[:action])
	end

	def volunteer
		@title = "Volunteer"
		@volunteer = Volunteer.new
	end

	def sponsor
		@title = "Sponsor"
		@sponsor = Sponsor.new
	end

	def blog
		@title = "Blog"
		@posts = Post.where("post_status='Published'")
	end

	def contact
		@title = "Contact"
		@sponsor = Sponsor.new
	end
end
