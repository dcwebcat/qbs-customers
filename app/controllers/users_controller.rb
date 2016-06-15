class UsersController < ApplicationController 
   
   before_action :set_user, only: [:edit, :update, :show]
   before_action :require_same_user, only: [:show, :edit, :update]
   before_action :require_admin, except: [:show, :edit, :update]

   
   def index
      @users = User.all.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
   end
   
   def show
      @readings = @user.readings.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
   end

   def new 
      @user = User.new
   end
   
   def create
      @user = User.new(user_params)
      
      if @user.save
         flash[:success] = "Customer has been added."
         redirect_to users_path
      else
         render 'new'
      end
   end
   
   def edit
      
   end
   
   def update
      if @user.update(user_params)
          flash[:success] = "Customer has been updated."
          redirect_to user_path(@user)
      else
         render 'edit'
      end
   end

   private
   
   def user_params
      params.require(:user).permit(:customer_number, :company, :password)
   end

   def set_user
    @user = User.find(params[:id])
   end

   def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only view and edit your own profile"
      redirect_to root_path
    end
   end

end