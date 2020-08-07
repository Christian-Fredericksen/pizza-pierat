class Customer < ApplicationRecord
    has_many :pizzas
    has_many :orders, through: :pizzas
    
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
   
    
end
