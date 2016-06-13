class UsersController < ApplicationController 
   
   def index
      @users = User.all 
   end
   
   def show
      @user = User.find(params[:id])
      @readings = @user.readings.order('updated_at DESC')
   end

end