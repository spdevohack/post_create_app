class Users::OmniauthController < ApplicationController
# github callback
def github
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user,  event: :authentication
    # set_flash_message(:notice, :success, kind: 'GitHub') if is_navigational_format?
  else
    flash[:error] = 'There was a problem signing you in through GitHub. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end


# google callback
def google_oauth2
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user
    # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  else
    flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end

# twitter callback
# def twitter
#   @user = User.create_from_twitter_data(request.env['omniauth.auth'])
#   if @user.persisted?
#     sign_in_and_redirect @user
#     set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
#   else
#     flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
#     redirect_to new_user_registration_url
#   end
# end

	def failure
  	flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
  	redirect_to new_user_registration_url
	end

end
