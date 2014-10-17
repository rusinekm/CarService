class Car < ActiveRecord::Base

  validates :brand, :model, :production_year, 
            :mileage, :last_service, presence: true

  validates :production_year, :mileage, 
            numericality: { only_integer: true }

            
end
