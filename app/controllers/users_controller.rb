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

  # def state
  #   render json: CS.state(params[:country]).to_json
  # end

  # def city
  #   render json: CS.cities(params[:state], params[:country])
  # end

end
