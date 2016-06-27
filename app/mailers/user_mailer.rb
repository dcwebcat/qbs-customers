class UserMailer < ApplicationMailer
    include ApplicationHelper
  
    default from: "noreply@copyquality.com"
    
    
    
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
    
    def support_email(message)
        @message = message
        @message.current_user = current_user
    
        mail(to: 'jenn@copyquality.com', 
            :from => @message.email, 
            :subject => 'Support Request', 
            :body => 'Customer Name: ' + @message.name + '\nCustomer Number: ' + @message.current_user.customer_number + '\nCompany: ' + @messgae.current_user.company  + '\nCustomer Phone: ' + @message.phone + '\nCustomer Message: ' + @message.content)
    end
end
