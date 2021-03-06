class UsersController < ApplicationController
 
   before_action :set_user, only: [:edit, :update, :destroy, :show]
 
  def index
    @users = User.all
  end

  def new
    if current_operator
      @user = User.new
    else
      redirect_to root_url
  end

  def create
    if current_operator
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    else
      flash.now.alert = "You must be logged in to add new clients to system"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.delete
    redirect_to users_path
  end
  

private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :surname,:email)
  end
  
end
 
