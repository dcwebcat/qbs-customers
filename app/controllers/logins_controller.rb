class LoginsController < ApplicationController
   
   def new
       
   end
   
   def create
       user = User.find_by(customer_number: params[:customer_number])
       
       if user && user.authenticate(params[:password])
           session[:user_id] = user.id
           flash[:success] = "You are now logged in."
           redirect_to home_path
       else
           flash.now[:danger] = "Your email or password does not match."
           render 'new'
       end
   end
   
   def destroy
       session[:user_id] = nil
       flash[:success] = "You are now logged out."
       redirect_to root_path
   end
    
end