class Order
    include ActiveModel::Model
    attr_accessor :name, :email, :phone, :equipment_id, :black_toner, :cyan_toner, :magenta_toner, :yellow_toner, :waste_toner, :postage_ink, :postage_labels, :postage_sealant, :staples, :current_user
    validates :name, :email, :phone, :equipment_id, presence: true
end
