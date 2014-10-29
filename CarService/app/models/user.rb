class User < ActiveRecord::Base

	validates :name, :surname, presence: true 
	validates :email, format: {with: /\A(([a-z_0-9.])+)@(([a-z]){1,5})\.(([a-z]){2,3})\Z/}

	has_many :rentals
	has_many :cars, through: :rentals

  def full_name
    "#{name} #{surname}"
  end
end
