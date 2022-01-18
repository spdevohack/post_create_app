class PostSendMail

	def initialize(post)
		@post = post
	end

	def send_mail
		PostMailer.new_post_mail(@post).deliver_now
	end

end