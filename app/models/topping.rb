class Topping < ApplicationRecord
    #belongs_to :pizza, optional: true # I don't think this line is needed. may cause problems. REMEMBER THIS!
    has_many :add_ons
    has_many :pizzas, through: :add_ons

end
