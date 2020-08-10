class PizzasController < ApplicationController
    def new 
        @pizza = Pizza.new 
    end

    def create
        @pizza = Pizza.create(pizza_params)
        redirect_to pizza_path(@pizza)
    end   

    def show
        @pizza = Pizza.find(params[:pizza_id])
    end

    private

    def pizza_params
        params.require(:pizza).permit(:crust, :cheese, :meats, :veggies)
    end

end
