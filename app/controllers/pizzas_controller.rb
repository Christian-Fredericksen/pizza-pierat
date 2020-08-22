class PizzasController < ApplicationController
    def new 
        @customer = current_customer
        @pizza = Pizza.new 
    end

    def create 
        topping_ids = []
        #@customer = current_customer
        @pizza = Pizza.new(pizza_params)
        @pizza.customer_id = session[:customer_id]
        topping_ids << @pizza.toppings
        
        if @pizza.save        
        redirect_to pizza_path(@pizza)
        else
            render :new
        end
    end   

    def index
        @pizzas = Pizza.all
    end

    def show   
        customer_id = session[:customer_id] 
        @pizza = Pizza.find(params[:id])
    end

    def edit
        @customer = current_customer
        @pizza = Pizza.find(params[:id])
    end

    def update
        @pizza = Pizza.find(params[:id])
        @pizza.update(pizza_params)
        redirect_to pizza_path(@pizza)
    end

    def destroy
        @pizza = Pizza.find(params[:id])
        @pizza.destroy
        redirect_to new_pizza_path
    end

    private

    def pizza_params       
        params.require(:pizza).permit(:size, :crust, :cheese, :customer_id, topping_ids: [] )
    end

end
