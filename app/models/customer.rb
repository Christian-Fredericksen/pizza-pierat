class Customer < ApplicationRecord
    has_many :pizzas
    has_many :orders, through: :pizzas
    validates :first_name, :last_name, :street_address, :city, :state, :zip_code, :phone_number, :email, presence: true

end
