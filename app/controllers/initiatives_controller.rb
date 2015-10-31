class InitiativesController < ApplicationController
  load_and_authorize_resource

  def new
    
  end

  def create
  	
  end

  private 
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def initiative_params
      params.require(:initiative).permit(:initiative_name,:initiative_desc,:initiative_category,:picture,:initiative_features)
    end
end