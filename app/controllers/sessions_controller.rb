class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :destroy, :create_with_omniauth]
  
    # Render a login form
    def new
      if logged_in?
        redirect_to customer_path
      end
    end
  
    # Login and redireect
    def create      
      customer = Customer.find_by(username: params[:username]) #put this back? customer = Customer.find_by(username: params[:username])
      if customer && customer.authenticate(params[:password])
        session[:customer_id] = customer.id
        redirect_to customer_path(customer.id)
      else
        flash[:errors] = ["Incorrect Username or Password"]
        redirect_to login_path
      end
    end

    def create_with_omniauth
      omniauth = request.env['omniauth.auth']['info']
      customer = Customer.find_or_create_by(email: omniauth["email"]) do |c|
        c.username = omniauth["name"]
        c.password = SecureRandom.hex
      end
      session[:customer_id] = customer.id
      redirect_to customer_path(customer.id)
    end
  
    # Logout
    def destroy
      session.delete(:customer_id)
      redirect_to home_path
    end
  end
