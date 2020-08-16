class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?

    def home
    end
  
    def current_customer
      if session[:customer_id]
        current_customer = Customer.find(session[:customer_id])
      end
    end
  
    def logged_in?
      !!current_customer
    end
  
    def authorized
      home unless logged_in?
    end
end
