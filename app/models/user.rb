class User < ApplicationRecord

 
  
  enum user_type: {admin: 0, customer:1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :posts, dependent: :destroy 

  mount_uploader :file, FileUploader
  # u = User.new

  # u.file = params[:file] # Assign a file like this, or

  # # like this
  # File.open('somewhere') do |f|
  #   u.file = f
  # end

  # u.save!
  # u.file.url # => '/url/to/file.png'
  # u.file.current_path # => 'path/to/file.png'
  # u.file_identifier
end
