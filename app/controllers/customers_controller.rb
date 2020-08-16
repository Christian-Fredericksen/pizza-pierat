class CustomersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
#Create

    def new
        @current_customer = Customer.new
    end

    def create
        @current_customer = Customer.create(customer_params)
        #byebug
        session[:customer_id] = @current_customer.id
        redirect_to customer_path(@current_customer)
    end
#Read

    def index
        @customers = Customer.all
    end

    def show
        #byebug
        @current_customer = Customer.find(params[:id])
    end

    private
    def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation, :username)
    end
end
