class PizzasController < ApplicationController
    def new 
        @pizza = Pizza.new 
    end

    def create
        @pizza = Pizza.create(params[:pizza])
    end

    def show
        @pizza = Pizza.find(params[:pizza_id])
    end

end
