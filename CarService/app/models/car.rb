class Car < ActiveRecord::Base

  validates :brand, presence: true

end
