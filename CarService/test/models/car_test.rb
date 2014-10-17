require 'test_helper'

class CarTest < ActiveSupport::TestCase
  
  test "Create car with valid hash" do
    assert_difference("Car.count", 1) do
      Car.create(valid_car_hash)
    end
  end





  # helper methods
  def valid_car_hash 
    {
      brand: "Ford",
      model: "Mustang II",
      production_year: "1963",
      mileage: 100_000
    }
  end


 


end
