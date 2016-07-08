class OrdersController < ApplicationController
  
  before_action :require_user
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)

    if @order.valid?
      UserMailer.order_email(@order, current_user).deliver_now
      flash[:success] = "Your order has been received. We will respond soon."
      redirect_to new_order_path
    else
      render :new
    end
    
  end

  private

    def order_params
      params.require(:order).permit(:name, :email, :phone, :equipment_id, :black_toner, :cyan_toner, :magenta_toner, :yellow_toner, :waste_toner, :postage_ink, :postage_labels, :postage_sealant, :staples, :current_user)
    end
end
