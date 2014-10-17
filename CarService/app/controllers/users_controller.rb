class UsersController < ApplicationController
 
   before_action :set_user, only: [:index, :show]
  
  def index
    @users = User.all
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :surname, :password, :email)
  end
 
end
