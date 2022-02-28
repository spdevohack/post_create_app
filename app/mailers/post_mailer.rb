class PostMailer < ApplicationMailer
	def new_post_mail(post)
		@post = post
		mail(from: ENV['SMTP_USER'], to: "ravinder@devohack.com", subject: "New Post created")
	end
end
