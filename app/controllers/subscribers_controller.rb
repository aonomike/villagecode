class SubscribersController < ApplicationController

    def index
    
    end

	def create
		@subscriber = Subscriber.new(subsciber_params)
		if @subscriber.save
            flash[:notice] = "<strong>Congrats!</strong> You are now in our subscription list!"
            redirect_to "/"
		end
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def subsciber_params
      params.require(:subscriber).permit(:email)
    end
end