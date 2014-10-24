class CarsController < ApplicationController

  def index
    @cars = Car.search(params).paginate(:page => params[:page], :per_page => 5)
  end
end
