class Pizza < ApplicationRecord
    belongs_to :customer
    belongs_to :order
    accepts_nested_attributes_for :toppings
end
