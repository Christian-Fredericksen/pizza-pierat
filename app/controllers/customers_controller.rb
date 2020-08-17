class CustomersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
#Create

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.create(customer_params)
        #byebug
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
    end
#Read
    def current_customer
        if session[:customer_id]
        current_customer = Customer.find(session[:customer_id])
        end

        #@current_customer ||= Customer.find_by_id(session[:customer_id]) if session[:customer_id]

    end
    def index
        @customers = Customer.all
    end

    def show
        #byebug
        @customer = Customer.find(params[:id])
    end

    private
    def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation, :username)
    end
end
