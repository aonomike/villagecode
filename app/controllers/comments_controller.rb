class CommentsController < ApplicationController
#	before_action :authenticate_user! ,except: [:show,:index]
	load_and_authorize_resource

	def index
		
	end

	def show
		@comment = Comment.find(params[:id])
		@post = Post.find(@comment.post_id)
	end
	
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end
	
	def edit
		@post = Post.find(params[:post_id])
		@comment= Comment.find(params[:id])
	end

	def update 
		@comment = Comment.find(params[:id])  
		@post =Post.find(@comment.post_id)
    	if @comment.update_attributes(comment_params)  
    	  flash[:notice] = "Successfully updated Comment."  
    	end  
    	respond_with(@post)
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
  		@comment.user_id = current_user.id

    	if @comment.save
    		redirect_to @post
    	end	
	end

	def destroy
		 @post = Post.find (params[:post_id])
		 @comment = Comment.find(params[:id])
    	 @comment.destroy()
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def comment_params
      params.require(:comment).permit(:body,:user_id,:post_id)
    end
end