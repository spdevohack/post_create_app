class PostMailer < ApplicationMailer
	def new_post_mail(post)
		@post = post
		mail(from: "7532970388sac@gmail.com", to: "ravinder@devohack.com", subject: "New Post created")
	end

end
