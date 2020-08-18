class ToppingsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
 
    def new
        @topping = Topping.new 
    end
    
    def index
        @toppings = Topping.all
    end
    private

    def topping_params
        params.require(:topping).permit(:name, :pizza_id)
    end
end




   # def new
    #     if @pizza = Pizza.find_by_id(params[:pizza_id])
    #         @topping = @pizza.toppings.build
    #     else
    #         @topping = Topping.new
    #     end
    # end

    # def create
    #     @topping = current_customer.toppings.build(topping_params)
    #     if @topping.save
    #         redirect_to topping_path(@topping)
    #     else
    #         render :new
    #     end
    # end

    # def show
    #     @topping = Topping.find_by(params[:id])
    # end

    # def index
    #     #byebug
    #     if @pizza = Pizza.find_by_id(params[:pizza_id])
    #         @topping = @pizza.toppings
    #     else            
    #     @toppings = Topping.all
    #     end
    # end