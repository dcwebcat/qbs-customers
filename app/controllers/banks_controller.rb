class BanksController < ApplicationController
  
  before_action :require_user
  before_action :require_admin, only: [:index]

  
  def index
    @banks = Bank.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end 

 def accounts
 
 end
  
  
  def new
    @bank = Bank.new(public_token: params[:public_token])

    
    # Pull the public_token from the querystring
    public_token = params[:public_token]
    account_id = params[:account_id]
    
    
  end

  def create
    
    # Pull the public_token from the querystring
    public_token = params[:public_token]
    account_id = params[:account_id]
    
    
    # Exchange the Link public_token for a Plaid API access token
    user2 = Plaid::User.exchange_token(public_token, account_id, product: :auth)
  
    # Initialize a Plaid user
  
    
    @invoice = params[:invoice]
    @amount = params[:amount]
    @email = params[:email]
  
    @amount = @amount.gsub('$', '').gsub(',', '')
  
    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_bank_path
      return
    end
  
    @amount = (@amount * 100).to_i # Must be an integer!
  
    if @amount < 500
      flash[:error] = 'Charge not completed. Payment amount must be at least $5.'
      redirect_to new_bank_path
      return
    end
    
    @bank = Bank.new
    @bank.user = current_user
    @bank.invoice = @invoice
    @bank.amount = @amount * 0.01
    @bank.customer = @email
    @bank.save
    
    Stripe::Charge.create(
      :amount => @amount,
      :currency => 'usd',
      :source => user2.stripe_bank_account_token,
      :description => 'Payment for Invoice #' + @invoice + ' for Customer #' + current_user.customer_number,
      :receipt_email => @email
    )
  end
  

end
