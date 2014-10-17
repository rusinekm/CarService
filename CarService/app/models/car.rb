class Car < ActiveRecord::Base

  validates :brand, :model, :production_year, 
            :mileage, :last_service, presence: true

  validates :mileage, numericality: { greater_than_or_equal_to: 0 }
  
  validates :production_year, numericality: { 
                              greater_than_or_equal_to: 1900,
                              less_than_or_equal_to: 2100}


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

