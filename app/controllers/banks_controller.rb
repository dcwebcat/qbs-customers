class BanksController < ApplicationController
  
  before_action :require_user
  before_action :require_admin, only: [:index]

  
  def index
    @banks = Bank.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end 

 def accounts
  
 end
  
  
  def new

  end

  def create
    
      
    @invoice = params[:invoice]
    @amount = params[:amount]
    @email = params[:email]
   
  end
end
