FactoryGirl.define do 
	factory :user do
		name "John"
		surname "Deere"
		 email "jeden@wp.pl"
	end
    factory :car do
      brand "Volkswagen"
      model "Golf"
      production_year "2001"
      mileage "30000"
      last_service "03-03-2005"
  end

  factory :rental do
    user
    car
    rented_to Date.today+2.days
  end
end