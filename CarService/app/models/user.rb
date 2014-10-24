class User < ActiveRecord::Base
	validates :name, :surname, presence: true
	validates :email, :with => /^(([a-z_0-9.])+)@(([a-z]){1,5})\.(([a-z]){2,3})$/

	has_many :rentals
	has_many :cars, through :rentals
end
