class Pizza < ApplicationRecord

    belongs_to :customer
    has_many :add_ons, dependent: :destroy
    has_many :toppings, through: :add_ons

    validates :size, presence: true
    validates :crust, presence: true
    validates :cheese, :toppings, presence: true

    def description
    self.size + ", " + self.cheese + " cheese, " + self.crust + " pizza with: "
    end

    def self.search(search)
        where(" (size) LIKE :search OR (crust) LIKE :search OR 
        (cheese) LIKE :search ", search: "%#{search}%")
    end
end


