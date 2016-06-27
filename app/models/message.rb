class Message
    include ActiveModel::Model
    attr_accessor :name, :email, :phone, :content, :current_user
    validates :name, :email, :phone, :content, presence: true
end
