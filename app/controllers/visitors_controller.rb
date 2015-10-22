class VisitorsController < ApplicationController

	def about
		@title = "About"
	end

	def index
		
	end

	def codeclub
		@title = "Code Club"
	end

	def tbc
		@title = "Teen Business Challenge"
	end

	def make
		@title = "Makers"
	end

	def volunteer
		@title = "Volunteer"
	end

	def sponsor
		@title = "Sponsor"
	end

	def blog
		@title = "Blog"
		@posts = Post.all
		
	end

	def contact
		@title = "Contact"
	end
end
