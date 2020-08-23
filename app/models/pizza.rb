class Pizza < ApplicationRecord
    belongs_to :customer
    #belongs_to :order
    has_many :add_ons, dependent: :destroy
    has_many :toppings, through: :add_ons
    validates :size, :cheese, :crust, presence: true
        def description
        self.size + ", " + self.cheese + " " + self.crust + " pizza with: "
        end
end
