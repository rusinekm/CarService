class Car < ActiveRecord::Base

  validates :brand, :model, :production_year,
            :mileage, :last_service, presence: true
  validates :mileage, numericality: { greater_than_or_equal_to: 0 }
 

  validate :proper_last_service_date
  
  validates :production_year, numericality: { 
    greater_than_or_equal_to: 1900,
    less_than_or_equal_to: 2100}

  has_many :rentals
  has_many :users, through: :rentals
 

  def is_rented
    result = false
    rentals.each do |rental|
      if rental.rented_to > Date.today()
        result = rental
      end
    end
      result
  end

  def proper_last_service_date
    if last_service && last_service > Date.today
      msg = "must be a date, can't be in future"
      errors.add(:last_service, msg)
    end
  end

  def self.search(params)
    if params[:user_id]
      car_ids = Rental.where(user_id: params[:user_id]).map(&:car_id)
      Car.where(id: car_ids)
    elsif params[:search]
      car_ids = []
      search_words = params[:search].split(' ').map(&:strip).uniq
      search_words.each do |search|
        car_ids += Rental.all.joins(:user).group(:user_id).where('users.name = ? OR users.surname = ?',search, search).map(&:car_id)
        car_ids += Car.where("brand LIKE ? OR model LIKE ? ", "%#{search}%", "%#{search}%").map(&:id)
      end
      Car.where(id: car_ids.uniq)
    else
      Car.all
    end
  end

  def full_car
       "#{brand} #{model}"
  end
end

