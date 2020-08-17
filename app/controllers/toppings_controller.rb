class ToppingsController < ApplicationController
    def new
    end

    def index
        @toppings = Topping.all
    end
end
