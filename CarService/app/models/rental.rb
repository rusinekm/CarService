class Rental < ActiveRecord::Base
  
     before_create :set_date  

	belongs_to :user
	belongs_to :car
 
  private
  def set_date
    self.rented_to = Date.new(2015,8,8).to_date
  end


  def self.current
    where(['rented_to >= ?', Date.today])

  end
end
