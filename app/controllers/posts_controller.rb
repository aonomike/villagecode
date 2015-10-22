class PostsController < ApplicationController
	  before_filter :authenticate_user!,:except =>["index","show"]

	def index
		redirect_to blog_path
	end

	def show
    end
	
	def new
		@post = Post.new
	end

	def create
	end
	
	def edit
		@post = Post.friendly.find(params[:id])
	end
	
	def update
		
	end

	def destroy
		
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def post_params
      params.require(:post).permit(:post_title,:post_content,:post_status,:by_line,:picture,:read_count)
    end
end