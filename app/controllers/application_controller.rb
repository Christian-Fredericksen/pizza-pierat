class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?, :current_customer

    def home
    end
  
    def current_customer
      if session[:customer_id]
        current_customer = Customer.find(session[:customer_id])
      end

      #@current_customer ||= Customer.find_by_id(session[:customer_id]) if session[:customer_id]

    end
  
    def logged_in?
      !!current_customer
    end
  
    def authorized
      home unless logged_in?
    end
end
