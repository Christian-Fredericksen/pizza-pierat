class CustomersController < ApplicationController
    #create
    def new
        @customer = Customer.new
    end
end
