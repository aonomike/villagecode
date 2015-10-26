class VolunteersController < ApplicationController
#  before_filter :authenticate_user!,:except =>["create"]
  load_and_authorize_resource :find_by => :slug

  def index
    @volunteers = Volunteer.all
  end

  def show
    @volunteer = Volunteer.friendly.find(params[:id])
    unless @volunteer == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    #@volunteer.area = params[:area].to_s
    if @volunteer.save
      flash[:notice]="Congrats! You are now a Village hero! "
      redirect_to "/volunteer"
    end
  end

  def destroy
    
  end

  def edit
    
  end

  def update
    
  end

    private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def volunteer_params
      params.require(:volunteer).permit(:name,:email,:engagement,:referrer,:additional_comments,:area=>[])
    end

end
