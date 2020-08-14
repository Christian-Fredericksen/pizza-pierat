class PizzasController < ApplicationController
    def new 
        @pizza = Pizza.new 
    end

    def create 
        @customer = current_customer
        @pizza = Pizza.create(pizza_params)
        redirect_to customer_pizza_path(@customer, @pizza)
    end   

    def index
        @pizzas = Pizza.all
    end

    def show
        @pizza = Pizza.find(params[:pizza_id])
    end

    private

    def pizza_params
        params.require(:pizza).permit(:size, :crust, :cheese, :meats, :veggies)
    end

end
