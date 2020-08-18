class Topping < ApplicationRecord
    belongs_to :pizza, optional: true
end
