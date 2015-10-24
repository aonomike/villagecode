module PostsHelper
	
	def get_author(post)
		return User.find(post.user_id).name
	end

	def get_post_picture(post)
        if !post.nil?
        	begin
                if post.picture.url(:original)!="Missing"   
                    return "<img src=#{post.picture.url(:original)} width='940' class='mb24' alt='Post'>".html_safe
                else
                    return "<img src='/assets/blog-single-3.jpg' width='940' class='mb24' alt='single1.jpg'>".html_safe
                end
            rescue SocketError=>e
                    return "<img src='/assets/blog-single-3.jpg' width='940' class='mb24' alt='single1.jpg'>".html_safe
            end
        end
    end

end
