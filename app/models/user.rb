class User < ApplicationRecord
  enum user_type: {admin: 0, customer:1 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

     

  #  def self.create_from_provider_data(provider_data)
  #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
  #     user.email = provider_data.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.skip_confirmation!
  #   end
  # end


  # devise  :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable,
  #       :confirmable, :lockable, :timeoutable,
  #       :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :twitter]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

	has_many :posts , dependent: :destroy
  mount_uploader :file, FileUploader


  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end  

  def active_for_authentication?  
    super && !deleted_at  
  end  

  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end  

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
