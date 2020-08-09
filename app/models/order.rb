class Order < ApplicationRecord
    has_many :pizzas
    has_many :customer through::pizzas
end
