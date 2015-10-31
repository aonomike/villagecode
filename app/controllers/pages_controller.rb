class PagesController < ApplicationController
	load_and_authorize_resource
	def index
		@pages = Page.all	
	end

	def new
		
	end

	def create
		
	end
end