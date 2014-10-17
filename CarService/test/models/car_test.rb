require 'test_helper'

class CarTest < ActiveSupport::TestCase
  
  test "Create car with valid hash" do
    assert_difference("Car.count", 1) do
      Car.create(valid_car_hash)
    end
  end


  test "Brand cannot be blank" do
    car = Car.new(valid_car_hash)
    car.brand = nil

    assert_equal false, car.valid?
    assert blank_error(car, :brand)
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


  def blank_error(obj, sym)
    obj.errors[sym].include?("can't be blank")
  end


end
