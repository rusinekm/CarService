class SessionsController < ApplicationController

  def new
  end
  
  def create
     operator = Operator.find_by_login(params[:login])
    if operator && operator.authenticate(params[:password]) 
      session[:operator_id] = operator.id
      redirect_to root_url, notice: "logged in! YAY"
    else
      flash.now.alert = "login or password is invalid"
      render "new"
    end
  end 

  def destroy
     session[:operator_id] = nil
     redirect_to root_url, notice: "Logged out"
  end
end
