class CustomersController < ApplicationController

#Create

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        @customer.save
        redirect_to customer_path(@customer)
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
        params.require(:customer).permit(:first_name, :last_name, :street_address, :city, :state, 
        :zip_code,:email, :phone_number)
    end
end
