class User < ActiveRecord::Base
    
    devise :database_authenticatable, :recoverable, :rememberable, :trackable
   
    before_save { self.company = company.upcase }
    has_many :readings
    validates :customer_number, presence: true, uniqueness: { case_sensitive: false }
    validates :company, presence: true
    has_secure_password
    
end