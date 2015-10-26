class PostsController < ApplicationController
	
    #before_filter :authenticate_user!,:except =>["index","show"]
	load_and_authorize_resource :find_by => :slug
	
	def index
		redirect_to blog_path
	end

	def show
		@post =Post.friendly.find(params[:id])
		count = @post.read_count.to_i+1
		@post.update_attributes(:read_count=>count.to_s)  
    end
	
	def new
		@post = Post.new
		@post.post_type = "DEFAULT"
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.read_count = 1
		if @post.save
			params['post_tags'].to_s.split(',').each do |tag|
				post_tag = @post.post_tags.new
				post_tag.tag = tag
				post_tag.save
			end

			params["post_selected_categories"].to_s.split(',').each do|category_id|
				categorized_post = CategorizedPost.new()
				categorized_post.post_id = @post.id
				categorized_post.category_id = category_id
				categorized_post.save
			end
			
			flash[:notice]="Thank you! Your submission has been received!"
			redirect_to @post
    	else
    		redirect_to :action => 'new'
    	end	

	end
	
	def edit
		@post = Post.friendly.find(params[:id])
	end
	
	def update
		@post= Post.friendly.find(params[:id])
		if @post.update_attributes(post_params)  
		  

		  flash[:notice] = "Successfully updated the post."  
    	  redirect_to @post
    	else
    		redirect_to :action => 'edit'
    	end	
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