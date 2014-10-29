class Operator < ActiveRecord::Base
  has_secure_password 
  validates :login, uniqueness: true 
end
