class Order < ApplicationRecord
    has_many :pizzas
    has_many :customers, through::pizzas
end
