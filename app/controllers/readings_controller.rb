class ReadingsController < ApplicationController 
   
   def index
      @readings = Reading.all.order('updated_at DESC') 
   end
   
   def show
      @reading = Reading.find(params[:id])
      @user = @reading.user
   end
   
   def new
      @reading = Reading.new 
   end
   
   def create 
      @reading = Reading.new(reading_params) 
      @reading.user = User.find(1)
      
      if @reading.save
          flash[:success] = "Your reading has been recorded. Thank you."
          redirect_to readings_path
      else
         render :new 
      end
   end
   
   def edit
       @reading = Reading.find(params[:id])
   end
   
   def update
       @reading = Reading.find(params[:id])
      
      if @reading.update(reading_params)
          flash[:success] = "Your reading has been updated. Thank you."
          redirect_to reading_path(@reading)
      else
         render :edit 
      end
   end
   
   private
   
    def reading_params
        params.require(:reading).permit(:equipment_number, :reading_bw, :reading_c1, :reading_c2, :reading_c3)
    end
end