class User < ActiveRecord::Base
   
    before_save { self.company = company.upcase }
    has_many :readings
    has_many :charges
    has_many :banks
    validates :customer_number, presence: true, uniqueness: { case_sensitive: false }
    validates :company, presence: true
    has_secure_password
end