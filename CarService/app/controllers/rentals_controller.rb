class RentalsController < ApplicationController

  def new
    if current_operator
      @rental = Rental.new
    else
      flash.alert = "You must be logged in to add new rentals to system"
      redirect_to root_url
    end
  end

  def create
    if current_operator
      @rental = Rental.new(rental_params)
      if @rental.save
        redirect_to root_url
      else
        render 'new'
      end
    else
      flash.now.alert = "You must be logged in to add new rentals to system"
    end
  end
  
  def rental_params
    params.require(:rental).permit(:user_id, :car_id)
  end
end
