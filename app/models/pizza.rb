class Pizza < ApplicationRecord
    belongs_to :customer
    #belongs_to :order
    has_many :toppings
    def description
        self.size + ", " + self.crust + " crust pizza, with " + self.cheese + " cheese" + "."
    end
end
