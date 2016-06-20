class ChargesController < ApplicationController
  
  before_action :require_user
  before_action :require_admin, only: [:index]

  
  def index
    @charges = Charge.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end 

  
  
  def new
    @charge = Charge.new
  end

  def create
    @customer = current_user.customer_number
    @invoice = params[:invoice]
    @amount = params[:amount]
  
    @amount = @amount.gsub('$', '').gsub(',', '')
  
    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_charge_path
      return
    end
  
    @amount = (@amount * 100).to_i # Must be an integer!
  
    if @amount < 500
      flash[:error] = 'Charge not completed. Payment amount must be at least $5.'
      redirect_to new_charge_path
      return
    end
    
    @charge = Charge.new
    @charge.user = current_user
    @charge.invoice = @invoice
    @charge.amount = @amount * 0.01
    @charge.customer = @customer
    @charge.save
    
    Stripe::Charge.create(
      :amount => @amount,
      :currency => 'usd',
      :source => params[:stripeToken],
      :description => 'Payment for Invoice #' + @invoice + ' for Customer #' + @customer
    )
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  
    
  end
  
  
end
