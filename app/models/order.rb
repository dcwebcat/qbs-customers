class Order
    include ActiveModel::Model
    attr_accessor :name, :email, :phone, :black_toner, :cyan_toner, :magenta_toner, :yellow_toner, :waste_toner, :postage_ink, :postage_labels, :postage_sealant, :staples, :current_user
    validates :name, :email, :phone, presence: true
end
