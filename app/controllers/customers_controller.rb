class CustomersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
#Create

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
        else
            flash[:errors] = @customer.errors.full_messages
            render :new
        end
    end
#Read
    def current_customer
        if session[:customer_id]
        current_customer = Customer.find(session[:customer_id])
        end
    end
    def index
        @customers = Customer.all
    end

    def show
       if @customer = Customer.find(params[:id])
       else
        current_customer
       end
    end

    private
    def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation, :username)
    end
end
