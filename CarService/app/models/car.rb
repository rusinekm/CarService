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




  validate :proper_last_service_date

  def proper_last_service_date
    if last_service && last_service > Date.today
      msg = "must be a date, can't be in future"
      errors.add(:last_service, msg)
    end
  end

end

