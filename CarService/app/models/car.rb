class Car < ActiveRecord::Base

  validates :brand, :model, :production_year, 
            :mileage, :last_service, presence: true

end
