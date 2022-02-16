class UsersController < ApplicationController
  def index
    @users =User.all
  end

  def show
    @user = User.find(current_user[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy ? @user.update(deleted_account = false) : @user.update(deleted_account = true)
  end

  # def states
  #   @target = params[:target]
  #   @states = CS.get(params[:country]).invert
  #   respond_to do |format|
  #     format.turbo_stream
  #   end
  # end

  

end


# def soft_delete  
#     update_attribute(:deleted_at, Time.current)  
#   end  

#   def active_for_authentication?  
#     super && !deleted_at  
#   end  

#   def inactive_message   
#     !deleted_at ? super : :deleted_account  
#   end  