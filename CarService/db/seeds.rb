# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Car.create(brand:"BMW", model:"300", production_year:2000, mileage: 100, last_service:"03-03-2014")
Car.create(brand:"BMW", model:"300s", production_year:2000, mileage: 100, last_service:"03-03-2014")
Car.create(brand:"Volkswagen", model:"Passat", production_year:2000, mileage: 100, last_service:"03-03-2014")
Car.create(brand:"Honda", model:"Accord", production_year:2010, mileage: 100, last_service:"03-03-2014")

User.create(name:"Jan", surname:"Kowalski", email:"kowalski@gmail.com")
User.create(name:"Paweł", surname:"Nowak", email:"nowak@gmail.com")

Rental.create(car_id:1, user_id:2, rented_to: "12-12-2015")
Rental.create(car_id:3, user_id:1, rented_to: "10-10-2013")
Rental.create(car_id:4, user_id:1, rented_to: "11-11-2014")