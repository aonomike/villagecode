class EventsController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  
  def index
  	redirect_to "/"
  end

  def create
  	
  end

  def destroy
  	
  end

  def edit
    @event = Event.friendly.find(params[:id])
  end
  
  def update
  	@event= Event.friendly.find(params[:id])
    if @event.update_attributes(event_params)  
      flash[:notice] = "<strong>Congrats!</strong> You successfully updated the event."  
      redirect_to "/"
    end
  end
  
  def show
    redirect_to "/"
  end

  
  private 
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def event_params
      params.require(:event).permit(:event_name,:event_desc,:event_category,:event_date,:picture,:event_time)
    end
end
