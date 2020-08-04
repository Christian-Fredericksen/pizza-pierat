class Customer < ApplicationRecord
    has_secure_password
    has_many :pizzas
    has_many :orders, through: :pizzas
    validates :first_name, :last_name, :street_address, :city, :state, :zip_code, :phone_number, :email, presence: true
    validates :email, uniqueness: true
   
    def full_name
        self.first_name + " " + self.last_name
    end
end
