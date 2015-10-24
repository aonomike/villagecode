module PostsHelper
	
	def get_author(post)
		return User.find(post.user_id).name
	end
end
