class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?, :current_customer, :authorized_to_edit?
    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404

    def rescue404
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

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
    
    def authorized_to_edit?(pizza)
      pizza.customer == current_customer
    end  
  
    def authorized
      home unless logged_in?
    end
end
