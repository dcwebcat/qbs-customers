class Message
    include ActiveModel::Model
    attr_accessor :name, :email, :phone, :content, :service_id, :current_user
    validates :name, :email, :phone, :content, :service_id, presence: true
end
