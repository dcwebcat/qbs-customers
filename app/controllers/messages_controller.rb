class MessagesController < ApplicationController
  
  before_action :require_user
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)

    if @message.valid?
      UserMailer.support_email(@message, current_user).deliver_now
      flash[:success] = "Your request has been received. We will respond soon."
      redirect_to new_message_path
    else
      render :new
    end
    
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :phone, :content, :service_id, :current_user)
    end
end
