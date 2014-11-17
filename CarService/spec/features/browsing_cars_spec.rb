require 'rails_helper'

RSpec.feature "BrowsingCars", :type => :feature do
  scenario "on the root page" do
    FactoryGirl.create(:car, production_year: 2011, brand: 'Seat', model: 'Ibiza')

    visit '/'
    expect(page).to have_text 'I want to rent something'
  end

  scenario "renting on root", js: true do

    FactoryGirl.create(:car,  production_year: 2011, brand: 'Opel', model: 'Corsa')
    FactoryGirl.create(:user, name: 'Jan' , surname: 'Kowalski')
     FactoryGirl.create(:car, production_year: 2011, brand: 'Seat', model: 'Ibiza')
     FactoryGirl.create(:user, name: 'Marian' , surname: 'Nowicki')


    visit '/'
    click_link 'I want to rent something'
    within('#new_rental') do
      select('Marian Nowicki', from: 'rental_user_id')
      select('Seat Ibiza', from: 'rental_car_id')
      click_button 'Create Rental'
    end
    expect(find('#table-wrapper')).to have_text "Marian Nowicki"
  end
end
