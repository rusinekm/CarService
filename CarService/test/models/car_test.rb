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


  test "Model cannot be blank" do
    car = Car.new(valid_car_hash)
    car.model = nil

    assert_equal false, car.valid?
    assert blank_error(car, :model)
  end


  test "Production year cannot be blank" do
    car = Car.new(valid_car_hash)
    car.production_year = nil

    assert_equal false, car.valid?
    assert blank_error(car, :production_year)
  end


  test "Mileage cannot be blank" do
    car = Car.new(valid_car_hash)
    car.mileage = nil

    assert_equal false, car.valid?
    assert blank_error(car, :mileage)
  end


  test "Last_service year cannot be blank" do
    car = Car.new(valid_car_hash)
    car.last_service = nil

    assert_equal false, car.valid?
    assert blank_error(car, :last_service)
  end


  # helper methods
  def valid_car_hash 
    {
      brand: "Ford",
      model: "Mustang II",
      production_year: 1963,
      mileage: 100_000,
      last_service: "2014-10-16"
    }
  end


  def blank_error(obj, sym)
    obj.errors[sym].include?("can't be blank")
  end


end
