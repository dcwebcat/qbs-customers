class UserMailer < ApplicationMailer
    
  
    default from: "noreply@copyquality.com"
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def readings_email(reading)
        @reading = reading
        @url = 'http://customers.copyquality.com/'
        mail(to: 'supplies@copyquality.com', subject: 'New Meter Readings')
    end
    
    def updated_readings_email(reading)
        @reading = reading
        @url = 'http://customers.copyquality.com/'
        mail(to: 'supplies@copyquality.com', subject: 'Updated Meter Readings')
    end
    
    def support_email(message, current_user)
        @message = message
    
        mail(to: 'service@copyquality.com', 
            :from => @message.email, 
            :subject => 'Support Request', 
            :body => "Customer Name: " + @message.name + "\r\nEmail: " + @message.email + "\r\nCustomer Number: " + current_user.customer_number + "\r\nCompany: " + current_user.company  + "\r\nService ID: " + @message.service_id + "\r\nPhone: " + @message.phone + "\r\n\r\nMessage: \r\n" + @message.content)
    end
    
    def order_email(order, current_user)
        @order = order
    
        mail(to: 'supplies@copyquality.com', 
            :from => @order.email, 
            :subject => 'Supplies Request', 
            :body => "Customer Name: " + @order.name + "\r\nEmail: " + @order.email + "\r\nCustomer Number: " + current_user.customer_number + 
            "\r\nCompany: " + current_user.company  + "\r\nPhone: " + @order.phone + "\r\nService ID: " + @order.service_id + "\r\n\r\nSupplies Needed: \r\nBlack Toner: " + @order.black_toner + 
            "\r\nCyan Toner: " + @order.cyan_toner + "\r\nMagenta Toner: " + @order.magenta_toner + "\r\nYellow Toner: " + @order.yellow_toner +
            "\r\nWaste Toner Bottle: " + @order.waste_toner + "\r\nStaples: " + @order.staples + "\r\nPostage Labels: " + @order.postage_labels + 
            "\r\nPostage Sealant Solution: " + @order.postage_sealant + "\r\nPostage Ink: " + @order.postage_ink +
            "\r\nWide Format Paper: " + @order.wide_format + "\r\nNotes: " + @order.supply_message)
    end
end
