class Reading < ActiveRecord::Base
 
  belongs_to :user
  validates :equipment_number, presence: true
  validates :reading_bw, presence: true
  validates :reading_c1, presence: true
  validates :reading_c2, presence: true
  validates :reading_c3, presence: true
  validates :user_id, presence: true
    
end