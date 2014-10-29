class CarsController < ApplicationController
 
   before_action :set_user, only: [:edit, :update, :destroy, :show]
 
  def index
    @cars = Car.search(params).paginate(:page => params[:page], :per_page => 5)
  end
 
 
  def new
		@car = Car.new
	end



def create
		@car = Car.new(car_params)
	if @car.save
		redirect_to @car
	else
		render 'new'
	end

  def create
    if current_operator   
      @car = Car.new(car_params)
      if @car.save
        redirect_to @car
      else
        render 'new'
      end
    else
      flash.now.alert = "You must be logged in to add new cars to system"
    end
  end
  
private

	def car_params
		params.require(:car).permit(:brand, :model, :production_year, :mileage)
	end

	end
end 
