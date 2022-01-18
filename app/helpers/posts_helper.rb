module PostsHelper

	def user_name(post)
		post.present? ? "#{ (post.user.name).capitalize}" : ''
	end

	def title(post)
		post.present? ? "#{(post.title).capitalize}" : ""
	end

end
