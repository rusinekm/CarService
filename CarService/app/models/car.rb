class Car < ActiveRecord::Base

  validates :brand, :model, :production_year, 
            :mileage, :last_service, presence: true

  validates :production_year, :mileage, 
            numericality: { only_integer: true }

  def isrented
    result = false
    car.rentals.each do |rental|
      if rental.rented_to > DateTime.now()
        result = rental
      end
    end
    result 
  end
end
