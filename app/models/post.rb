class Post < ApplicationRecord
  belongs_to :user
  # validates :title, format: {with: /\A[A-Za-z\s]+\z/, message: "only letters are allowed"}, presence: true
  # validates :description, length: {minimum: 50, message: "is too short please type again"}, presence: true

  enum state: {draft: 0, published: 1 }

  mount_uploader :attachment, AttachmentUploader



#Search Bar Query
  # def self.search(search)
  #   if search
  #     where("title iLIKE ?", "%#{search}%").order("title")
  #     # joins(:user).where("name iLIKE ?", "%#{search}%").order("posts.id desc")
  #     # where("")
  #   else   
  #     all
  #   end
  # end

end
