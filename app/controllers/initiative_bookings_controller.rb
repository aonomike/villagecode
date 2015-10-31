class InitiativeBookingsController < ApplicationController
  def index
    
  end

  def new
  
  	authenticate_user!
  	@initiative = Initiative.friendly.find(params[:initiative_id])
  	@initiative_booking =@initiative.initiative_bookings.new
  
  end

  def create
  	
  end

end
