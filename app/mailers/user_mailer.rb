class UserMailer < ApplicationMailer
    
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
end
