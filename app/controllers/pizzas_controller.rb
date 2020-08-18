class PizzasController < ApplicationController
    def new 
        @customer = current_customer
        @pizza = Pizza.new 
    end

    def create 
        toppings = []
        # @customer = current_customer
        # @pizza = Pizza.create(pizza_params)
        pizza = Pizza.new(pizza_params)
        pizza.customer_id = session[:customer_id]
        pizza.toppings << toppings
        if pizza.save        
        redirect_to pizza_path(pizza)
        else
            render :new
        end
       
    end   

    def index
        @pizzas = Pizza.all
    end

    def show        
        @pizza = Pizza.find(params[:id])
    end

    private

    def pizza_params
        params.require(:pizza).permit(:size, :crust, :cheese, :add_on_ids [], :customer_id)
    end

end
