class PizzasController < ApplicationController
    before_action :authorized

    def new 
        @customer = current_customer
        @pizza = Pizza.new 
    end

    def create 
        @pizza = Pizza.new(pizza_params)
        @pizza.customer_id = session[:customer_id]
        if @pizza.valid?
            @pizza.save  
        redirect_to customer_pizza_path(current_customer, @pizza)
        else
            flash[:errors] = @pizza.errors.full_messages
            redirect_to new_customer_pizza_path(current_customer.id)   
        end
    end   

    def index        
        @pizzas = current_customer.pizzas.search(params[:search])
    end

    def show  
       if @pizza = Pizza.find(params[:id])
    else
        current_customer
       end
    end

    def edit
        @customer = current_customer
        @pizza = Pizza.find(params[:id])
        if authorized_to_edit?(@pizza)
            render :edit   
        else 
            flash[:errors] = ["You cannot edit that pizza"]
            redirect_to customer_pizza_path(current_customer)   
        end
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
