class PizzasController < ApplicationController
    def new 
        @pizza = Pizza.new 
    end

    def create 
        #byebug       
        @pizza = Pizza.create(pizza_params)
        redirect_to pizza_path(@pizza)
    end   

    def show
        @pizza = Pizza.find(params[:pizza_id])
    end

    private

    def pizza_params
        params.require(:pizza).permit(:size, :crust, :cheese, :meats, :veggies)
    end

end
