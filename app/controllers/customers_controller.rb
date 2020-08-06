class CustomersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
#Create

    def new
        @customer = Customer.new
    end

    def create
        customer = Customer.create(customer_params)
        session[:customer_id] = customer.id
        redirect_to customer_path
    end
#Read

    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    private
    def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation, :username)
    end
end
