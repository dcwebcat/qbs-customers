class ReadingsController < ApplicationController 
   
   before_action :set_reading, only: [:edit, :update, :show, :record]
   before_action :require_user 
   before_action :require_same_user, only: [:show, :edit, :update]
   before_action :require_admin, only: [:record]
   
   def index
     if current_user.admin?
      @readings = Reading.all.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
    else
      @readings = @current_user.readings.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
    end
   end
   
   def show
      @user = @reading.user
   end
   
   def new
      @reading = Reading.new 
   end
   
   def create 
      @reading = Reading.new(reading_params) 
      @reading.user = current_user
      
      if @reading.save
          flash[:success] = "Your reading has been received. Thank you."
          redirect_to readings_path
      else
         render :new 
      end
   end
   
   def edit
      
   end
   
   def update
      if @reading.update(reading_params)
          flash[:success] = "Your reading has been updated. Thank you."
          redirect_to reading_path(@reading)
      else
         render :edit 
      end
   end
   
   def record
      if @reading.recorded == false
         @reading.update_attribute(:recorded, true)
         redirect_to reading_path(@reading)
      else 
         @reading.update_attribute(:recorded, false)
         redirect_to reading_path(@reading)
      end 
   end
   
   private
   
    def reading_params
      params.require(:reading).permit(:equipment_number, :reading_bw, :reading_c1, :reading_c2, :reading_c3)
    end
    
    def set_reading
      @reading = Reading.find(params[:id])
    end

   def require_same_user
    if current_user != @reading.user && !current_user.admin?
      flash[:danger] = "You can only view and edit your own readings"
      redirect_to readings_path
    end
   end
end