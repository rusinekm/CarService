class RentalsController < ApplicationController
 
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to @rental
    else
      render 'new'
    end
  end
  
  def rental_params
    params.require(:rental).permit(:user_id, :car_id, :rented_to)
  end
end
