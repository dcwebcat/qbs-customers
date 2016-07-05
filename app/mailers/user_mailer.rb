class UserMailer < ApplicationMailer
    
  
    default from: "noreply@copyquality.com"
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def readings_email(reading)
        @reading = reading
        @url = 'http://copyquality.com/customer_portal'
        mail(to: 'jenn@copyquality.com', subject: 'New Meter Readings')
    end
    
    def updated_readings_email(reading)
        @reading = reading
        @url = 'http://copyquality.com/customer_portal'
        mail(to: 'jenn@copyquality.com', subject: 'Updated Meter Readings')
    end
    
    def support_email(message, current_user)
        @message = message
    
        mail(to: 'jenn@copyquality.com', 
            :from => @message.email, 
            :subject => 'Support Request', 
            :body => "Customer Name: " + @message.name + "\r\nEmail: " + @message.email + "\r\nCustomer Number: " + current_user.customer_number + "\r\nCompany: " + current_user.company  + "\r\nPhone: " + @message.phone + "\r\nMessage: \r\n" + @message.content)
    end
    
    def order_email(order, current_user)
        @order = order
    
        mail(to: 'jenn@copyquality.com', 
            :from => @order.email, 
            :subject => 'Supplies Request', 
            :body => "Customer Name: " + @order.name + "\r\nEmail: " + @order.email + "\r\nCustomer Number: " + current_user.customer_number + 
            "\r\nCompany: " + current_user.company  + "\r\nPhone: " + @order.phone + "\r\nSupplies Needed: \r\nBlack Toner: " + @order.black_toner + 
            "\r\nCyan Toner: " + @order.cyan_toner + "\r\nMagenta Toner: " + @order.magenta_toner + "\r\nYellow Toner: " + @order.yellow_toner +
            "\r\nWaste Toner Bottle: " + @order.waste_toner + "\r\nStaples: " + @order.staples + "\r\nPostage Labels: " + @order.postage_labels + 
            "\r\nPostage Sealant Solution: " + @order.postage_sealant + "\r\nPostage Ink: " + @order.postage_ink)
    end
end
