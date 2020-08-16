class PizzasController < ApplicationController
    def new 
        @customer = @current_customer
        @pizza = Pizza.new 
    end

    def create 
       
        @pizza = Pizza.create(pizza_params)
        #byebug
        
        redirect_to pizza_path(@pizza)
       
    end   

    def index
        @pizzas = Pizza.all
    end

    def show
        @pizza = Pizza.find(params[:pizza_id])
    end

    private

    def pizza_params
        params.require(:pizza).permit(:size, :crust, :cheese)
    end

end
