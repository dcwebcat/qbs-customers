class BanksController < ApplicationController
  
  before_action :require_user
  before_action :require_admin, only: [:index]

  
  def index
    @banks = Bank.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end 

 
  
  
  def new
    @bank = Bank.new(public_token: params[:public_token])
  end

  def create
    
    # Pull the public_token from the querystring
    public_token = params[:public_token]
    account_id = params[:account_id]
    
    
    # Exchange the Link public_token for a Plaid API access token
    user2 = Plaid::User.exchange_token(public_token, account_id, product: :auth)
  
    # Initialize a Plaid user
    #user2 = Plaid::User.load(:auth, exchange_token_response.access_token)
    
    @invoice = params[:invoice]
    @amount = params[:amount]
    @email = params[:email]
    @public_token = params[:public_token]
    @account_id = params[:account_id]
  
    @amount = @amount.gsub('$', '').gsub(',', '')
  
    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please try again and enter a valid amount in USD ($).'
      redirect_to payments_path
      return
    end
  
    @amount = (@amount * 100).to_i # Must be an integer!
  
    
    
    @bank = Bank.new
    @bank.user = current_user
    @bank.invoice = @invoice
    @bank.amount = @amount * 0.01
    @bank.customer = @email
    @bank.public_token = @public_token
    @bank.account_id = @account_id
    @bank.save
    
    
    
    Stripe::Charge.create(
      :amount => @amount,
      :currency => 'usd',
      :source => user2.stripe_bank_account_token,
      :description => 'Payment for Invoice #' + @invoice + ' for Customer #' + current_user.customer_number,
      :receipt_email => @email,
      :metadata => {"Customer Email: " => @email}
    )
  end
  

end
