class SessionController < ApplicationController
skip_before_action :redirect_if_not_logged_in
    
    def home
    end

    def new
    end

    def create
        # if params[:provider] == 'github'
        #   @user = User.create_by_github_omniauth(auth)
        #   session[:user_id] = @user.id
        #   redirect_to user_path(@user)
        # else
        @customer = Customer.find_by(email: params[:customer][:email])
        if @customer && @customer.authenticate(params[:customer][:password])
            session[:customer_id] = @customer.id 
            redirect_to customer_path(@customer)
        else
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end

   
end
