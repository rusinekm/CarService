class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_if_exits(params[:email]) # metoda do zrobienia jeszcze
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to root_url, notice: "logged in!"
    else
      flash.now.alert = "login or password is invalid"
      render "new"
    end
  end 

  def destroy
     session[:user_id] = nil
     redirect_to root_url, notice: "Logged out"
  end
end
