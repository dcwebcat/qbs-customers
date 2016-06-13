class User < ActiveRecord::Base
   
    before_save { self.company = company.upcase }
    has_many :readings
    validates :customer_number, presence: true, uniqueness: { case_sensitive: false }
    validates :company, presence: true
    
end