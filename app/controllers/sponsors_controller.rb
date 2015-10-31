class SponsorsController < ApplicationController
	
    #before_filter :authenticate_user!,:except =>["index","show"]
	load_and_authorize_resource :find_by => :slug

	def index
		
	end

	def create
		@sponsor = Sponsor.new(sponsor_params)
	    #@sponsor.area = params[:area].to_s
	    if @sponsor.save
	      flash[:notice]="Thank You! We will get back to you shortly! "
	      redirect_to "/sponsor"
	    end
	end

	def show
		@sponsor = Sponsor.friendly.find(params[:id])
	end
	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def sponsor_params
      params.require(:sponsor).permit(:name,:email,:referrer,:message)
    end
end