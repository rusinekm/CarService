class Car < ActiveRecord::Base

  validates :brand, :model, :production_year, 
            :mileage, :last_service, presence: true

  validates :production_year, :mileage, 
            numericality: { only_integer: true }

  def is_rented?
    result = false
    car.rentals.each do |rental|
      if rental.rented_to > Date.today()
        result = rental
      end
    end
    result 
  end

  def self.search(params)
  if params[:user_id]
    ids = Rental.where(user_id: param:user_name.map(&:car_id)
    Article.where("id in (?)", ids)
  elsif params[:search]
    search_words = params[:search].split(',').map(&:strip).uniq
    seaarch_words.each do |search|
      ids = Article.where('model LIKE ?', "%#{search}%") 
      ids += Article.where('brand LIKE ?', "%#search]%")
      ids += Rental.where(user_name: search).map(&:car_id)
      Article.where("id in (?)", ids) 
  else
    Article.all
  end
end
end
