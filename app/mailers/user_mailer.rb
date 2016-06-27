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
end
