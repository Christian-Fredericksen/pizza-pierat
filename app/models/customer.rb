class Customer < ApplicationRecord
    has_many :pizzas
    has_many :orders, through: :pizzas
    
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
   
    def full_name
        self.first_name + " " + self.last_name
    end
end
